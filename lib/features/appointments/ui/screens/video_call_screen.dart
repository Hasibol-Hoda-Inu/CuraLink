// import 'dart:async';
//
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:curalink/application/agora_config.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class VideoCallScreen extends StatefulWidget {
//   const VideoCallScreen({super.key});
//
//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }
//
// class _VideoCallScreenState extends State<VideoCallScreen> {
//   RtcEngine? _engine;
//   late final Future<void> _initialization;
//
//   @override
//   void initState() {
//     super.initState();
//     _initialization = _initializeAgora();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Consultation'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<void>(
//         future: _initialization,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }
//           if (snapshot.connectionState != ConnectionState.done) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return AgoraVideoView(
//             controller: VideoViewController(
//               rtcEngine: _engine!,
//               canvas: const VideoCanvas(uid: 0),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _initializeAgora() async {
//     final permissions = await [
//       Permission.camera,
//       Permission.microphone,
//     ].request();
//
//     if (permissions.values.any((status) => !status.isGranted)) {
//       throw Exception('Camera and microphone permissions required');
//     }
//
//     if (!mounted) return;
//
//     final engine = createAgoraRtcEngine();
//     _engine = engine;
//
//     await engine.initialize(
//       const RtcEngineContext(
//         appId: AgoraConfig.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ),
//     );
//
//     await engine.enableVideo();
//     await engine.startPreview();
//
//     debugPrint('✅ Agora RTC initialized successfully');
//   }
//
//   Future<void> _releaseAgora() async {
//     try {
//       await _initialization;
//     } catch (_) {
//       ///TODO: Release resources even if initialization fails.
//     }
//
//     await _engine?.release();
//   }
//
//   @override
//   void dispose() {
//     unawaited(_releaseAgora());
//     super.dispose();
//   }
// }

import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:curalink/application/agora_config.dart';
import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key, this.doctorName});

  final String? doctorName;

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  RtcEngine? _engine;
  RtcEngineEventHandler? _eventHandler;

  VideoViewController? _localController;
  VideoViewController? _remoteController;

  late final Future<void> _initialization;
  Future<void>? _cleanupFuture;

  int? _remoteUid;
  bool _isJoined = false;
  bool _micMuted = false;
  bool _cameraEnabled = true;
  bool _speakerEnabled = true;
  bool _remoteCameraOff = false;
  bool _isEnding = false;

  String? _error;
  String? _warning;

  Timer? _callTimer;
  DateTime? _callStartedAt;

  @override
  void initState() {
    super.initState();
    _initialization = _initializeAgora();
  }

  Future<void> _initializeAgora() async {
    try {
      final permissions = await [
        Permission.camera,
        Permission.microphone,
      ].request();

      if (permissions.values.any((status) => !status.isGranted)) {
        throw StateError('Camera and microphone permissions are required');
      }

      if (AgoraConfig.rtcToken.isEmpty) {
        throw StateError('Agora RTC token is missing');
      }

      if (!mounted || _isEnding) return;

      final engine = createAgoraRtcEngine();
      _engine = engine;

      await engine.initialize(
        const RtcEngineContext(
          appId: AgoraConfig.appId,
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ),
      );

      if (!mounted || _isEnding) return;

      _eventHandler = RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          if (!mounted || _isEnding) return;

          setState(() => _isJoined = true);
          debugPrint('Joined Agora channel: ${connection.channelId}');
        },

        onUserJoined: (connection, uid, elapsed) {
          if (!mounted || _isEnding) return;

          _remoteController?.dispose();

          _remoteController = VideoViewController.remote(
            rtcEngine: engine,
            canvas: VideoCanvas(uid: uid),
            connection: connection,
          );

          _callStartedAt ??= DateTime.now();

          _callTimer ??= Timer.periodic(const Duration(seconds: 1), (_) {
            if (mounted && !_isEnding) setState(() {});
          });

          setState(() {
            _remoteUid = uid;
            _remoteCameraOff = false;
          });
        },

        onUserOffline: (connection, uid, reason) {
          if (!mounted || _isEnding || _remoteUid != uid) return;

          _remoteController?.dispose();
          _remoteController = null;

          _callTimer?.cancel();
          _callTimer = null;
          _callStartedAt = null;

          setState(() {
            _remoteUid = null;
            _remoteCameraOff = false;
          });
        },

        onUserMuteVideo: (connection, uid, muted) {
          if (!mounted || _isEnding || _remoteUid != uid) return;

          setState(() => _remoteCameraOff = muted);
        },

        onTokenPrivilegeWillExpire: (connection, token) {
          if (!mounted || _isEnding) return;

          setState(() {
            _warning = 'Session token is expiring soon';
          });
        },

        onError: (error, message) {
          debugPrint('Agora RTC error: $error - $message');
        },
      );

      engine.registerEventHandler(_eventHandler!);

      await engine.enableVideo();
      await engine.startPreview();
      await engine.setEnableSpeakerphone(true);

      if (!mounted || _isEnding) return;

      _localController = VideoViewController(
        rtcEngine: engine,
        canvas: const VideoCanvas(uid: 0),
      );

      setState(() {});

      await engine.joinChannel(
        token: AgoraConfig.rtcToken,
        channelId: AgoraConfig.channelName,
        uid: AgoraConfig.rtcUid,
        options: const ChannelMediaOptions(
          channelProfile: ChannelProfileType.channelProfileCommunication,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
          publishCameraTrack: true,
          publishMicrophoneTrack: true,
          autoSubscribeAudio: true,
          autoSubscribeVideo: true,
        ),
      );
    } catch (error) {
      debugPrint('Agora initialization error: $error');

      if (mounted && !_isEnding) {
        setState(() => _error = error.toString());
      }
    }
  }

  Future<void> _toggleMicrophone() async {
    final engine = _engine;
    if (engine == null || _isEnding) return;

    final muted = !_micMuted;

    await engine.muteLocalAudioStream(muted);

    if (mounted) {
      setState(() => _micMuted = muted);
    }
  }

  Future<void> _toggleCamera() async {
    final engine = _engine;
    if (engine == null || _isEnding) return;

    final enabled = !_cameraEnabled;

    await engine.enableLocalVideo(enabled);

    if (mounted) {
      setState(() => _cameraEnabled = enabled);
    }
  }

  Future<void> _switchCamera() async {
    if (_engine == null || !_cameraEnabled || _isEnding) return;

    await _engine!.switchCamera();
  }

  Future<void> _toggleSpeaker() async {
    final engine = _engine;
    if (engine == null || _isEnding) return;

    final enabled = !_speakerEnabled;

    await engine.setEnableSpeakerphone(enabled);

    if (mounted) {
      setState(() => _speakerEnabled = enabled);
    }
  }

  String get _callDuration {
    final startedAt = _callStartedAt;
    if (startedAt == null) return '00:00';

    final duration = DateTime.now().difference(startedAt);

    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  Future<void> _endCall() async {
    if (_isEnding) return;

    setState(() => _isEnding = true);

    try {
      await _cleanup();
    } catch (error) {
      debugPrint('Agora cleanup error: $error');
    }

    if (mounted) context.pop();
  }

  Future<void> _cleanup() {
    return _cleanupFuture ??= _releaseResources();
  }

  Future<void> _releaseResources() async {
    _callTimer?.cancel();

    await _initialization;

    final engine = _engine;
    if (engine == null) return;

    if (_eventHandler != null) {
      engine.unregisterEventHandler(_eventHandler!);
    }

    _remoteController?.dispose();
    _localController?.dispose();

    try {
      await engine.leaveChannel();
    } finally {
      await engine.release();
    }
  }

  Widget _callControl({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool active = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6.h,
      children: [
        IconButton.filledTonal(
          onPressed: _isEnding ? null : onPressed,
          style: IconButton.styleFrom(
            fixedSize: Size.square(50.w),
            backgroundColor: active
                ? AppColors.primaryColor
                : const Color(0xFF283448),
            foregroundColor: Colors.white,
          ),
          icon: Icon(icon, size: 22.sp),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 11.sp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Video Consultation',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.h,
              children: [
                Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                Text(_error!, textAlign: TextAlign.center),
                ElevatedButton(
                  onPressed: _endCall,
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFF101827),
      body: Stack(
        children: [
          Positioned.fill(
            child: _remoteController != null && !_remoteCameraOff
                ? AgoraVideoView(controller: _remoteController!)
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 12.h,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Colors.white54,
                          size: 72.sp,
                        ),
                        Text(
                          !_isJoined
                              ? 'Connecting...'
                              : _remoteUid == null
                              ? 'Waiting for doctor to join'
                              : 'Doctor camera is off',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        if (!_isJoined) const CircularProgressIndicator(),
                      ],
                    ),
                  ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.h,
                children: [
                  Text(
                    widget.doctorName ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _remoteUid != null
                        ? _callDuration
                        : _isJoined
                        ? 'Waiting for participant'
                        : 'Connecting',
                    style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                  ),
                  if (_warning != null)
                    Text(
                      _warning!,
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 11.sp,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120.h,
            right: 16.w,
            child: Container(
              width: 110.w,
              height: 150.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFF283448),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white24),
              ),
              child: _localController != null && _cameraEnabled
                  ? AgoraVideoView(controller: _localController!)
                  : const Center(
                      child: Icon(
                        Icons.videocam_off_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _callControl(
                      icon: _micMuted ? Icons.mic_off : Icons.mic,
                      label: 'Microphone',
                      active: _micMuted,
                      onPressed: _toggleMicrophone,
                    ),
                    _callControl(
                      icon: _cameraEnabled
                          ? Icons.videocam
                          : Icons.videocam_off,
                      label: 'Camera',
                      active: !_cameraEnabled,
                      onPressed: _toggleCamera,
                    ),
                    _callControl(
                      icon: Icons.cameraswitch_outlined,
                      label: 'Switch',
                      onPressed: _switchCamera,
                    ),
                    _callControl(
                      icon: _speakerEnabled ? Icons.volume_up : Icons.hearing,
                      label: 'Speaker',
                      active: _speakerEnabled,
                      onPressed: _toggleSpeaker,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 6.h,
                      children: [
                        IconButton.filled(
                          onPressed: _isEnding ? null : _endCall,
                          style: IconButton.styleFrom(
                            fixedSize: Size.square(50.w),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.call_end),
                        ),
                        Text(
                          'End',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    unawaited(_cleanup());
    super.dispose();
  }
}
