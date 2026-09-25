import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocalAmbulanceCard extends StatelessWidget {
  final String clinicName;
  final String ambulanceInfo;
  final VoidCallback onCall;

  const LocalAmbulanceCard({
    super.key,
    required this.clinicName,
    required this.ambulanceInfo,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF2F4F7), width: 1.w),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.airport_shuttle_rounded,
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 4.w,
              children: [
                Text(
                  clinicName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ambulanceInfo,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          IconButton.filled(
              onPressed: onCall,
              icon: Icon(Icons.phone, size: 20.sp, color: Colors.white,),
            padding: EdgeInsets.all(12.w),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryColor
            ),
          )
        ],
      ),
    );
  }
}
