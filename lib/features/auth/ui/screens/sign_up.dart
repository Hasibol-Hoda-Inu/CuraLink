import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 40.h),
        child: Column(
          children: [
            Text("Sign up"),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
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
                ]
              ),
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value){}),
                RichText(
                  text: TextSpan(
                    text: "I agree to the ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ]
                  )
                ),
              ],
            ),
            Spacer(),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("Sign up"))),
            Row(
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: (){},
                    child: Text("Sign in", style: TextStyle(color: Colors.blue),)
                ),
              ],
            ),
          ]
        )
      )
    );
  }
}
