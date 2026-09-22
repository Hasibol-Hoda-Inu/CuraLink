import 'package:curalink/application/app_colors.dart';
import 'package:curalink/features/doctors/ui/widgets/dashed_divider.dart';
import 'package:curalink/features/doctors/ui/widgets/doc_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF2F4F7)),
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Booking ID: ",
                  style: TextStyle(fontSize: 14.sp, color: AppColors.greyText),
                  children: [
                    TextSpan(
                      text: "#APT-84920",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F8F0),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: const Color(0xFF00A859).withAlpha(50),
                  ),
                ),
                child: Text(
                  "Paid",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF00A859),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const DashedDivider(),
          SizedBox(height: 16.h),
          DocProfileWidget(),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                _buildDetailRow(
                  icon: Icons.calendar_today_outlined,
                  label: "Schedule",
                  valueWidget: Column(
                    crossAxisAlignment: .end,
                    spacing: 2.h,
                    children: [
                      Text(
                        "Wed, Oct 23, 2024",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "02:00 PM",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: const Color(0xFFEBEBEB),
                ),
                _buildDetailRow(
                  icon: Icons.location_on_outlined,
                  label: "Location",
                  valueWidget: Column(
                    crossAxisAlignment: .end,
                    spacing: 2.h,
                    children: [
                      Text(
                        "Suite 402, 4th Floor",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF101623),
                        ),
                      ),
                      Text(
                        "800m away",
                        style: TextStyle(
                          color: const Color(0xFF8A96A3),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: const Color(0xFFEBEBEB),
                ),
                _buildDetailRow(
                  icon: Icons.credit_card_outlined,
                  label: "Payment",
                  valueWidget: Row(
                    mainAxisSize: .min,
                    spacing: 8.h,
                    children: [
                      Text(
                        "Visa •••• 4242",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6B779A),
                        ),
                      ),
                      Text(
                        "\$88.50",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF101623),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required Widget valueWidget,
  }) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Icon(
          icon,
          color: AppColors.primaryColor,
          size: 20.sp,
        ),
        SizedBox(width: 12.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Align(alignment: Alignment.centerRight, child: valueWidget),
        ),
      ],
    );
  }
}
