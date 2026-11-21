import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/common/ui/widgets/quick_action_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentDetailsBottomSheet extends StatelessWidget {
  const AppointmentDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD4D6DD),
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: .start,
            spacing: 12.w,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 6.h,
                  children: [
                    Text(
                      "Appointment\nDetails",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Make a call to the receptionist",
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, size: 24.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            spacing: 8.w,
            children: [
              SvgPicture.asset(
                AssetsPath.appointmentIconFilled, 
                width: 22,
                colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
              Text('21 Nov 2026 • 04:00 PM',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 24.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final List<IconData> icons = [
                Icons.local_hospital_rounded,
                Icons.local_hospital_rounded,
                Icons.location_on_rounded,
              ];
              final List<String> clinics = [
                "017xxxxxxxx",
                "019xxxxxxxx",
                "Dinajpur Sadar",
              ];
              final List<String> details = [
                "Receptionist 24/7",
                "Receptionist 24/7",
                "Check location on google map",
              ];
              return QuickActionCard(
                icon: icons[index],
                clinicName: clinics[index],
                ambulanceInfo: details[index],
                onCall: () {},
              );
            },
          ),
        ],
      ),
    );;
  }
}
