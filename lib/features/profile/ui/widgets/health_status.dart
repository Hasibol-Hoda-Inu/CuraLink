import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthStatus extends StatelessWidget {
  const HealthStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.monitor_heart,
              color: AppColors.primaryColor,
              size: 32.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              "Heart rate",
              style: TextStyle(
                color: const Color(0xFF7A9AE5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "215bpm",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          height: 40.h,
          width: 1.w,
          color: const Color(0xFFE0E9F8),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department, // Or your SvgPicture
              color: AppColors.primaryColor,
              size: 32.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              "Calories",
              style: TextStyle(
                color: const Color(0xFF7A9AE5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "756cal",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          height: 40.h,
          width: 1.w,
          color: const Color(0xFFE0E9F8),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.scale,
              color: AppColors.primaryColor,
              size: 32.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              "Weight",
              style: TextStyle(
                color: const Color(0xFF7A9AE5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "103lbs",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
  
}