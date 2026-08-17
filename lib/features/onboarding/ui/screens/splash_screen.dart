import 'package:curalink/application/assets_path.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _goToNextScreen();
  }

  void _goToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if(mounted) {
      GoRouter.of(context).pushReplacementNamed(AppRouteConst.onboardingRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: Image.asset(AssetsPath.splash).image, fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            SvgPicture.asset(AssetsPath.logo, width: 184.w,),
            Text("Healthcare",
              style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff223A6A),
              ),
            ),
            Text("Medical app",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      )
    );
  }
}
