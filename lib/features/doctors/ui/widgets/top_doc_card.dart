import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/doctors/ui/widgets/review_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDocCard extends StatelessWidget {
  const TopDocCard({
    super.key, required this.onClick,
  });

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: BoxBorder.all(color: Colors.grey.shade300),
        ),
        child: Row(
          spacing: 8.w,
          children: [
            Image.asset(AssetsPath.topDoc, height: 96.h,),
            Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Dr. Vaamana", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
                    Text("Orthopaedic", style: TextStyle(color: AppColors.greyText),),
                    ReviewChip(),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey.shade400,),
                        Text("800m away", style: TextStyle(color: AppColors.greyText),),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}