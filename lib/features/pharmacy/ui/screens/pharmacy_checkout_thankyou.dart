import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/doctors/ui/widgets/success_pulse_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PharmacyCheckoutThankYouScreen extends StatefulWidget {
  const PharmacyCheckoutThankYouScreen({super.key});

  @override
  State<PharmacyCheckoutThankYouScreen> createState() => _PharmacyCheckoutThankYouScreenState();
}

class _PharmacyCheckoutThankYouScreenState extends State<PharmacyCheckoutThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 30.h),
            SuccessPulseAnimation(),
            Text(
              "Thanks for Purchasing",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text("Thanks for choosing us. for any query contact this number"),
            Text("+880 12345-6789"),
            SizedBox(height: 20.h,),
            ElevatedButton(
              onPressed: goToPharmacyScreen,
              child: Text("Browse more Medicines"),
            ),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }

  void goToPharmacyScreen(){
    context.goNamed(AppRouteConst.pharmacyRoute);
  }
}
