import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 40.h),
        child: Column(
          children: [
            Form(
              child: Column(
                spacing: 14.h,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: .centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            ElevatedButton(onPressed: toHomeScreen, child: Text("Login")),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("Sign up",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Row(
              crossAxisAlignment: .center,
              spacing: 12.w,
              children: [
                Expanded(child: Divider()),
                Text(
                  "Or",
                  style: TextStyle(fontSize: 16.sp, color: Color(0xffA1A8B0)),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 30.h),
            OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: .center,
                spacing: 8.w,
                children: [
                  SvgPicture.asset(AssetsPath.googleLogo, width: 20.w),
                  Text("Login with google"),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text("Login with Facebook"),
              icon: Icon(
                Icons.facebook,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toHomeScreen(){
    GoRouter.of(context).pushReplacementNamed(AppRouteConst.homeRoute);
  }
}
