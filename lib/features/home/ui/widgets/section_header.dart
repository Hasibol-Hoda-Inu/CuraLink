import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text("Health article",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
        TextButton(
            onPressed: (){},
            child: Text("See all")
        )
      ],
    );
  }
}