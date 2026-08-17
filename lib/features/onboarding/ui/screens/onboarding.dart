import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Row(
                  children: [
                    Spacer(),
                    TextButton(onPressed: (){}, child: Text("Skip")),
                  ],
                ),
                Image.asset(AssetsPath.docf, height: 467.h,),
                Text("Find a lot of specialist doctors in one place",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    CircleAvatar(),
                    IconButton.filled(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_forward_rounded),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
