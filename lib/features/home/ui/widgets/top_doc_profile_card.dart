import 'package:curalink/application/app_colors.dart';
import 'package:curalink/features/common/ui/widgets/distance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDocProfileCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final String specialty;
  final String rating;
  final String distance;
  final String price;
  final VoidCallback onTap;

  const TopDocProfileCard({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          mainAxisSize: .min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    imagePath,
                    height: 140.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 4.w,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: const Color(0xFFFFB01D),
                          size: 18.sp,
                        ),
                        Text(
                          rating,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4.h,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Divider(color: const Color(0xFFF2F4F7), height: 1.h, thickness: 1.h),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                DistanceWidget(),
                Text.rich(
                  TextSpan(
                    text: "\$$price",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: "/hr",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF8A96A3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}