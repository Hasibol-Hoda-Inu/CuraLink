import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewChip extends StatelessWidget {
  const ReviewChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.all(2),
      labelPadding: const EdgeInsets.only(left: 0, right: 8),
      side: BorderSide.none,
      avatar: Icon(Icons.star_rounded, color: AppColors.primaryColor,),
      label: Text("4.7", style: TextStyle(color: AppColors.primaryColor),),
      backgroundColor: AppColors.primaryColor.withAlpha(17),
    );
  }
}