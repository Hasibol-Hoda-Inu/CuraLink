import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/doctors/ui/widgets/booking_summary_card.dart';
import 'package:curalink/features/doctors/ui/widgets/success_pulse_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookingConfirmation extends StatefulWidget {
  const BookingConfirmation({super.key});

  @override
  State<BookingConfirmation> createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends State<BookingConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              SuccessPulseAnimation(),
              Text(
                "Booking Confirmed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text.rich(
                TextSpan(
                  text: "Your appointment with ",
                  children: [
                    TextSpan(
                      text: "Dr. Rishi",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: " has been successfully scheduled.",
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h,),
              BookingSummaryCard(),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () {},
                child: Text("Go to My Appointments"),
              ),
              SizedBox(height: 10.h,),
              TextButton(
                onPressed: toHome,
                child: Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toMyAppointments(){}
  void toHome(){
    GoRouter.of(context).pushReplacementNamed(AppRouteConst.homeRoute);
  }
}
