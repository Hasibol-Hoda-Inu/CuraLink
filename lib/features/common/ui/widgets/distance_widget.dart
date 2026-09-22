import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';

class DistanceWidget extends StatelessWidget {
  const DistanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: AppColors.greyText,),
        Text("1.2 Km", style: TextStyle(color: AppColors.greyText),),
      ],
    );
  }
}