import 'package:curalink/application/app_colors.dart';
import 'package:curalink/features/appointments/ui/widgets/confirmed_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfflineAppointmentCard extends StatelessWidget {
  const OfflineAppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.imagePath,
    required this.schedule,
    required this.onDetails,
  });

  final String doctorName;
  final String specialization;
  final String imagePath;
  final String schedule;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFFF2F4F7),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF101623).withAlpha(8),
            blurRadius: 20.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 6.w,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primaryColor,
                size: 18.sp,
              ),
              const Text('In-Person Visit'),
              const Spacer(),
              ConfirmedTag(),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                imagePath,
                width: 56.w,
                height: 56.w,
                fit: BoxFit.contain,
              ),
            ),
            title: Text(
              doctorName,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
            subtitle: Text(specialization),
          ),
          SizedBox(height: 10.h,),
          Row(
            spacing: 8.w,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16.sp,
                color: AppColors.primaryColor,
              ),
              Text(schedule, style: TextStyle(fontSize: 12.sp)),
            ],
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryColor,
                side: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.w,
                ),
              ),
              child: Text("View Details"),

            )
          ),
        ],
      ),
    );
  }
}
