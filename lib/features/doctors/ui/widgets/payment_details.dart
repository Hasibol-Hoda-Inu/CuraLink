import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsWidget extends StatelessWidget {
  final double consultationFee;

  const PaymentDetailsWidget({
    super.key,
    required this.consultationFee,
  });

  @override
  Widget build(BuildContext context) {

    const double bookingFee = 5.00;
    const double tax = 3.50;
    final double total = consultationFee + bookingFee + tax;
    
    final labelStyle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.greyText,
    );
    
    final valueStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
    
    final boldStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          "Payment Detail",
          style: boldStyle,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Consultation Fee", style: labelStyle),
            Text("\$${consultationFee.toStringAsFixed(2)}", style: valueStyle),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Booking & Service Fee", style: labelStyle),
            Text("\$${bookingFee.toStringAsFixed(2)}", style: valueStyle),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("tax", style: labelStyle),
            Text("\$${tax.toStringAsFixed(2)}", style: valueStyle),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(color: const Color(0xFFEBEBEB), height: 1.h, thickness: 1.h),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: boldStyle),
            Text("\$${total.toStringAsFixed(2)}", style: boldStyle),
          ],
        ),
      ],
    );
  }
}