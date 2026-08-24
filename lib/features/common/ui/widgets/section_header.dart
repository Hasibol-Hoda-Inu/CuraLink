import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onClick,
  });

  final String title;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
        TextButton(
            onPressed: onClick,
            child: Text("See all")
        )
      ],
    );
  }
}