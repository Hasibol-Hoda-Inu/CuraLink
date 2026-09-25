import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onClick,
  });

  final String label;
  final String iconPath;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Column(
        spacing: 10.h,
        mainAxisSize: .min,
        children: [
          SvgPicture.asset(iconPath, width: 44.w, height: 44.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
