import 'package:curalink/application/app_theme.dart';
import 'package:curalink/application/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CuraLink extends StatelessWidget {
  const CuraLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: appRouter,

        theme: AppThemeData.lightThemeData,
        themeMode: ThemeMode.light,
        // home: SplashScreen(),
      ),
    );
  }
}
