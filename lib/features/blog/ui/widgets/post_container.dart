import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    super.key,
    required this.onClick,
  });

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
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
          spacing: 10.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                AssetsPath.cardiologistImg,
                height: 110.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4.h,
                children: [
                  Text(
                    "10 Simple Daily Habits for Long Term Health",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Wrap(
                    spacing: 10.w,
                    children: [
                      Text("December 21, 2026",
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),),
                      Text("5 min read",
                          style: TextStyle(fontSize: 10.sp, color: Colors.grey)
                      ),
                    ],
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