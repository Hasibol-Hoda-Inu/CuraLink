import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/common/ui/widgets/payment_details.dart';
import 'package:curalink/features/common/ui/widgets/price_action_bar.dart';
import 'package:curalink/features/doctors/ui/widgets/appointment_details_card.dart';
import 'package:curalink/features/doctors/ui/widgets/doc_profile.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              DocProfileWidget(),
              AppointmentDetailsCard(),
              PaymentDetailsWidget(fee1Amount: 80, fee1: 'Consultation Fee', fee2: 'Booking & Service Fee',),
              PriceActionBar(price: 88.50, onClick: toBookingConfirmation,),
            ],
          ),
        ),
      ),
    );
  }

  void toBookingConfirmation(){
    context.goNamed(AppRouteConst.bookingConfirmationRoute);
  }
}

