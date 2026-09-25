import 'package:curalink/application/app_colors.dart';
import 'package:curalink/features/home/ui/widgets/local_ambulance_card.dart';
import 'package:curalink/features/home/ui/widgets/national_emergency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyAmbulance extends StatelessWidget {
  const EmergencyAmbulance({super.key});

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
                      "Emergency\nAmbulance",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Tap a provider to call immediately.",
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
          SizedBox(height: 24.h),
          NationalEmergencyCard(onCall: () {}),
          SizedBox(height: 24.h),
          Text(
            "Nearby Hospital Ambulances",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.greyText,
            ),
          ),
          SizedBox(height: 12.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final clinics = [
                "Hili Central Clinic",
                "Joypurhat ICU Transport",
                "Red Crescent Response",
              ];
              final details = [
                "ICU & Oxygen • 1.2 km",
                "Critical Care • 2.8 km",
                "Trauma & First Aid • 3.5 km",
              ];
              return LocalAmbulanceCard(
                clinicName: clinics[index],
                ambulanceInfo: details[index],
                onCall: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
