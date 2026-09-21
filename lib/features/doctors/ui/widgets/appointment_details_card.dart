import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetailsCard extends StatelessWidget {
  const AppointmentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFEBEBEB),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: 16.h,
        children: [
          Text(
            "APPOINTMENT DETAILS",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.greyText,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Wed",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withAlpha(200),
                      ),
                    ),
                    Text(
                      "23",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Wednesday, Oct 23, 2024",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF101623),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "02:00 PM - 02:30 PM (30 Mins)",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF717784),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F8F0),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        spacing: 6.w,
                        children: [
                          Container(
                            width: 6.w,
                            height: 6.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFF00A859),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Confirmed Slot",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF00A859),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: const Color(0xFFEBEBEB), height: 1.h, thickness: 1.h),
          Row(
            crossAxisAlignment: .start,
            spacing: 12.w,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.business,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2.h,
                  children: [
                    Text(
                      "In-Clinic Consultation",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF101623),
                      ),
                    ),
                    Text(
                      "Physical doctor check-up & review",
                      style: TextStyle(
                        color: const Color(0xFF717784),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: .start,
            spacing: 12.w,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: const Color(0xFF4A545E),
                  size: 20.sp,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2.h,
                  children: [
                    Text(
                      "Metro Heart Clinic",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF101623),
                      ),
                    ),
                    Text(
                      "3rd Floor, Suite 402 • Maple Avenue",
                      style: TextStyle(
                        color: const Color(0xFF717784),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}