import 'package:curalink/application/app_colors.dart';
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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        routeInformationProvider: appRouter.routeInformationProvider,

        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: AppColors.primaryColor,
          fontFamily: "Poppins",
        ),

        // home: SplashScreen(),
      ),
    );
  }
}
