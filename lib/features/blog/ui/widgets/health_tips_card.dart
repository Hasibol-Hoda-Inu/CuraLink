import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthTipsCard extends StatelessWidget {
  final IconData categoryIcon;
  final String category;
  final String title;
  final String description;
  final String author;
  final VoidCallback onClick;

  const HealthTipsCard({
    super.key,
    required this.categoryIcon,
    required this.category,
    required this.title,
    required this.description,
    required this.author,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 260.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xFFF2F4F7), width: 1.w),
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
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    categoryIcon,
                    color: AppColors.primaryColor,
                    size: 20.sp,
                  ),
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}