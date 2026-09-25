import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductReviewWidget extends StatefulWidget {
  const ProductReviewWidget({
    super.key,
  });

  @override
  State<ProductReviewWidget> createState() => _ProductReviewWidgetState();
}

class _ProductReviewWidgetState extends State<ProductReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Row(
          spacing: 4,
          children: [
            Icon(Icons.star_rounded, color: AppColors.primaryColor, size: 20.sp,),
            Icon(Icons.star_rounded, color: AppColors.primaryColor, size: 20.sp,),
            Icon(Icons.star_rounded, color: AppColors.primaryColor, size: 20.sp,),
            Icon(Icons.star_rounded, color: AppColors.primaryColor, size: 20.sp,),
            Text("4.0", style: TextStyle(fontSize: 18.sp),),
          ],
        ),
      ],
    );
  }
}