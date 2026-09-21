import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 40.h),
        child: Column(
          children: [
            SizedBox(height: 40.h),
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
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text("Go to My Appointments"),
            ),
            SizedBox(height: 10.h,),
            TextButton(
              onPressed: () {},
              child: Text(
                "Back to Home",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
