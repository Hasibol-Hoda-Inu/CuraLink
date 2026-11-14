import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({
    super.key, 
    required this.fee1Amount,
    required this.fee1,
    required this.fee2,
    this.fee3,
  });

  final double fee1Amount;
  final String fee1;
  final String fee2;
  final String? fee3;
  
  @override
  Widget build(BuildContext context) {
    const double bookingFee = 5.00;
    const double tax = 3.50;
    final double total = fee1Amount + bookingFee + tax;

    final labelStyle = TextStyle(fontSize: 14.sp, color: AppColors.greyText);
    final valueStyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
    final boldStyle = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text("Payment Detail", style: boldStyle),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(fee1, style: labelStyle),
            Text("\$${fee1Amount.toStringAsFixed(2)}", style: valueStyle),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(fee2, style: labelStyle),
            Text("\$${bookingFee.toStringAsFixed(2)}", style: valueStyle),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Tax", style: labelStyle),
            Text("\$${tax.toStringAsFixed(2)}", style: valueStyle),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(color: const Color(0xFFEBEBEB), height: 1.h, thickness: 1.h),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Total", style: boldStyle),
            Text("\$${total.toStringAsFixed(2)}", style: boldStyle),
          ],
        ),
      ],
    );
  }
}
