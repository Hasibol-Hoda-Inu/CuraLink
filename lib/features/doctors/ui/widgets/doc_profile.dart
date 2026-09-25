import 'package:curalink/application/app_colors.dart';
import 'package:curalink/features/common/ui/widgets/distance_widget.dart';
import 'package:curalink/features/doctors/ui/widgets/review_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocProfileWidget extends StatelessWidget {
  const DocProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: Colors.grey.shade300),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Container(
            height: 116.h,
            width: 96.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withAlpha(28),
              borderRadius: BorderRadius.circular(16.sp),
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Dr. Vaamana", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
                  Text("Orthopaedic", style: TextStyle(color: AppColors.greyText),),
                  Row(
                    spacing: 10.w,
                    children: [
                      ReviewChip(),
                      DistanceWidget(),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}