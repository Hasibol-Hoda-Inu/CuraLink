// import 'package:curalink/application/assets_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
//             child: Column(
//               crossAxisAlignment: .center,
//               children: [
//                 Row(
//                   children: [
//                     Spacer(),
//                     TextButton(onPressed: (){}, child: Text("Skip")),
//                   ],
//                 ),
//                 Image.asset(AssetsPath.docf, height: 467.h,),
//                 Text("Find a lot of specialist doctors in one place",
//                   style: TextStyle(
//                     fontSize: 22.sp,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: .spaceBetween,
//                   children: [
//                     CircleAvatar(),
//                     IconButton.filled(
//                         onPressed: (){},
//                         icon: Icon(Icons.arrow_forward_rounded),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Container(
//             color: Colors.blue,
//           ),
//           Container(
//             color: Colors.green,
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _onboardingData = [
    {
      "title": "Find a lot of specialist doctors in one place",
      "image": AssetsPath.docF
    },
    {
      "title": "Get advice only from a doctor you believe in.",
      "image": AssetsPath.docM
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = _onboardingData[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(
                      item["image"]!,
                      height: 467.h,
                    ),
                    // SizedBox(height: 30.h),
                    Text(
                      item["title"]!,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Positioned(
            top: 50.h,
            right: 20.w,
            child: _currentIndex == _onboardingData.length - 1
                ? const SizedBox.shrink()
                : TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  _onboardingData.length - 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontSize: 16.sp),
              ),
            ),
          ),

          Positioned(
            bottom: 50.h,
            left: 30.w,
            right: 30.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _onboardingData.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 8),
                      height: 10.h,
                      width: _currentIndex == index ? 24.w : 10.w,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      GoRouter.of(context).pushReplacementNamed(AppRouteConst.getStartedRoute);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 24.w, vertical: 12.h),
                  ),
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
