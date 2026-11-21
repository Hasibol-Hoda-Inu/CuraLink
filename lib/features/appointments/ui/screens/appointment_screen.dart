import 'package:curalink/application/assets_path.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/appointments/ui/widgets/appointment_details_bottom_sheet.dart';
import 'package:curalink/features/appointments/ui/widgets/offline_appointment_card.dart';
import 'package:curalink/features/appointments/ui/widgets/online_appointment_card.dart';
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
          'My Appointments',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20.w),
        itemCount: 2,
        separatorBuilder: (_, _) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          if (index == 0) {
            return OnlineAppointmentCard(
              doctorName: 'Dr. Sarah Ahmed',
              specialization: 'General Physician',
              imagePath: AssetsPath.docF,
              schedule: '20 Nov 2026 • 10:30 AM',
              onJoinCall: onTapVideoScreen,
            );
          }
          return OfflineAppointmentCard(
            doctorName: 'Dr. Imran Hossain',
            specialization: 'Cardiologist',
            imagePath: AssetsPath.docM,
            schedule: '21 Nov 2026 • 04:00 PM',
            onDetails: onTapDetails,
          );
        },
      ),
    );
  }

  void onTapVideoScreen(){
    context.pushNamed(AppRouteConst.videoCallRoute);
  }

  void onTapDetails() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context)=> AppointmentDetailsBottomSheet());
  }
}
