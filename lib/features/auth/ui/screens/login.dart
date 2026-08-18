import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 40.h),
        child: Column(
          children: [
            Text("Sign in"),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                    onPressed: (){},
                    child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: Colors.blue,
                        ))),
              ],
            ),
            SizedBox(height: 50.h,),
            ElevatedButton(onPressed: (){}, child: Text("Sign in")),
            Row(
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: (){},
                    child: Text("Sign up", style: TextStyle(color: Colors.blue),)
                ),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              crossAxisAlignment: .center,
              children: [
                Expanded(child: Divider()),
                Text("Or"),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 25.h,),
            ElevatedButton(
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 25.w,
                  children: [
                    SvgPicture.asset(AssetsPath.googleLogo),
                    Text("Sign in with google"),
                  ],
                ),
            ),
            ElevatedButton.icon(
                onPressed: (){},
                label: Text("Sign in with Facebook"),
                icon: Icon(Icons.facebook)
            ),
          ],
        ),
      ),
    );
  }
}
