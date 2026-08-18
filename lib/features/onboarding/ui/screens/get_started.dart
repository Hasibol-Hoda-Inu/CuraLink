import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(AssetsPath.logo),
            Text("Healthcare",
              style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xff223A6A),
            ),),
            SizedBox(height: 24.h,),
            Text("Let’s get started!",
              style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),),
            Text("Login to Stay healthy and fit",
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.greyText
              ),
            ),
            SizedBox(height: 42.h,),
            ElevatedButton(onPressed: (){}, child: Text("Login")),
            ElevatedButton(onPressed: (){}, child: Text("Sign up")),
          ],
        ),
      )
    );
  }
}
