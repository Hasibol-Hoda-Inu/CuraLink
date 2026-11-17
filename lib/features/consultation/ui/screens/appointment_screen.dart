import 'package:curalink/application/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Your appointments will appear here.'),
            ElevatedButton(onPressed: toVideoCall, child: Text("Video Call")),
          ],
        ),
      ),
    );
  }

  void toVideoCall() {
    context.go(AppRouteConst.videoCallRoute);
  }
}
