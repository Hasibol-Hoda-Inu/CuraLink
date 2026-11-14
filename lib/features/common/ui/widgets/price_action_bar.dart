import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceActionBar extends StatelessWidget {
  const PriceActionBar({
    super.key, required this.price, required this.onClick,
  });

  final double price;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text("Total", style: TextStyle(
              color: AppColors.greyText,
              fontWeight: FontWeight.w500,
            ),),
            Text("\$${price.toStringAsFixed(2)}", style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),),
          ],
        ),
        Expanded(child: ElevatedButton(
            onPressed: onClick,
            child: Text("Checkout")
        )),
      ],
    );
  }
}