import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NationalEmergencyCard extends StatelessWidget {
  final VoidCallback onCall;

  const NationalEmergencyCard({super.key, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCall,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFE61C44),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE61C44).withValues(alpha: 0.3),
              blurRadius: 20.r,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          spacing: 16.w,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.phone, color: Colors.white, size: 28.sp),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4.h,
                children: [
                  Text(
                    "National Emergency (999)",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Toll-Free • Instant Auto-Dispatch",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}