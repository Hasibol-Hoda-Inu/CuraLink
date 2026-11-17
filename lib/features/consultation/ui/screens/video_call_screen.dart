import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:curalink/application/agora_config.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  RtcEngine? _engine;
  late final Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _initializeAgora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Consultation'),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return AgoraVideoView(
            controller: VideoViewController(
              rtcEngine: _engine!,
              canvas: const VideoCanvas(uid: 0),
            ),
          );
        },
      ),
    );
  }

  Future<void> _initializeAgora() async {
    final permissions = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (permissions.values.any((status) => !status.isGranted)) {
      throw Exception('Camera and microphone permissions required');
    }

    if (!mounted) return;

    final engine = createAgoraRtcEngine();
    _engine = engine;

    await engine.initialize(
      const RtcEngineContext(
        appId: AgoraConfig.appId,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ),
    );

    await engine.enableVideo();
    await engine.startPreview();

    debugPrint('✅ Agora RTC initialized successfully');
  }

  Future<void> _releaseAgora() async {
    try {
      await _initialization;
    } catch (_) {
      ///TODO: Release resources even if initialization fails.
    }

    await _engine?.release();
  }

  @override
  void dispose() {
    unawaited(_releaseAgora());
    super.dispose();
  }
}
