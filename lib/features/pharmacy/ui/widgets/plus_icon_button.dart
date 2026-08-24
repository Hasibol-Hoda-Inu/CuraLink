import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlusIconButton extends StatelessWidget {
  const PlusIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 18.w,
        height: 18.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}