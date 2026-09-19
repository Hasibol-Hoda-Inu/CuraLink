import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultationTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String duration;
  final IconData mainIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const ConsultationTypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.duration,
    required this.mainIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color inactiveBorderColor = Color(0xFFEBEBEB);
    const Color inactiveIconBgColor = Color(0xFFF5F6F9);
    const Color textColor = Color(0xFF101623);
    const Color subTextColor = Color(0xFFA1A8B0);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : inactiveBorderColor,
            width: 1.5.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryColor : inactiveIconBgColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    mainIcon,
                    color: isSelected ? Colors.white : const Color(0xFF717784),
                    size: 24.sp,
                  ),
                ),
                Icon(
                  isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: isSelected ? AppColors.primaryColor : const Color(0xFFD4D6DD),
                  size: 24.sp,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: subTextColor,
              ),
            ),
            SizedBox(height: 12.h),
            Divider(color: inactiveBorderColor, height: 1.h, thickness: 1.h),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? AppColors.primaryColor : textColor,
                  ),
                ),
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: subTextColor,
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