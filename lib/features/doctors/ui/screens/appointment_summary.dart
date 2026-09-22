import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/doctors/ui/widgets/appointment_details_card.dart';
import 'package:curalink/features/doctors/ui/widgets/doc_profile.dart';
import 'package:curalink/features/doctors/ui/widgets/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppointmentSummary extends StatefulWidget {
  const AppointmentSummary({super.key});

  @override
  State<AppointmentSummary> createState() => _AppointmentSummaryState();
}

class _AppointmentSummaryState extends State<AppointmentSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Summary",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              DocProfileWidget(),
              AppointmentDetailsCard(),
              PaymentDetailsWidget(consultationFee: 80,),
              Row(
                spacing: 10.w,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text("Total", style: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text("\$88.50", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),),
                    ],
                  ),
                  Expanded(child: ElevatedButton(
                      onPressed: toBookingConfirmation,
                      child: Text("Pay & Confirm")
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toBookingConfirmation(){
    GoRouter.of(context).pushNamed(AppRouteConst.bookingConfirmationRoute);
  }
}

