import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/auth/ui/screens/login.dart';
import 'package:curalink/features/auth/ui/screens/sign_up.dart';
import 'package:curalink/features/onboarding/ui/screens/get_started.dart';
import 'package:curalink/features/onboarding/ui/screens/onboarding.dart';
import 'package:curalink/features/onboarding/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: AppRouteConst.splashRoute,
      path: "/",
      pageBuilder: (context, state)=> const MaterialPage(child: SplashScreen()),

    ),
    GoRoute(
      name: AppRouteConst.onboardingRoute,
      path: "/onboarding",
      pageBuilder: (context, state)=> const MaterialPage(child: OnboardingScreen()),

    ),
    GoRoute(
      name: AppRouteConst.getStartedRoute,
      path: "/getStarted",
      pageBuilder: (context, state)=> const MaterialPage(child: GetStartedScreen()),

    ),
    GoRoute(
      name: AppRouteConst.loginRoute,
      path: "/login",
      pageBuilder: (context, state)=> const MaterialPage(child: LoginScreen()),

    ),
    GoRoute(
      name: AppRouteConst.signUpRoute,
      path: "/signUp",
      pageBuilder: (context, state)=> const MaterialPage(child: SignUp()),

    ),
  ]
);