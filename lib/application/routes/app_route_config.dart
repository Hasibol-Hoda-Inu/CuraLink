import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/appointments/ui/screens/appointment_screen.dart';
import 'package:curalink/features/appointments/ui/screens/video_call_screen.dart';
import 'package:curalink/features/auth/ui/screens/login.dart';
import 'package:curalink/features/auth/ui/screens/sign_up.dart';
import 'package:curalink/features/blog/ui/screens/blog_archive.dart';
import 'package:curalink/features/blog/ui/screens/single_blog_page.dart';
import 'package:curalink/features/common/ui/screens/main_bottom_nav.dart';
import 'package:curalink/features/doctors/ui/screens/appointment_summary.dart';
import 'package:curalink/features/doctors/ui/screens/booking_confirmation.dart';
import 'package:curalink/features/doctors/ui/screens/doctor_details.dart';
import 'package:curalink/features/doctors/ui/screens/top_doctors.dart';
import 'package:curalink/features/home/ui/screens/home_screen.dart';
import 'package:curalink/features/onboarding/ui/screens/get_started.dart';
import 'package:curalink/features/onboarding/ui/screens/onboarding.dart';
import 'package:curalink/features/onboarding/ui/screens/splash_screen.dart';
import 'package:curalink/features/pharmacy/ui/screens/cart_screen.dart';
import 'package:curalink/features/pharmacy/ui/screens/pharmacy.dart';
import 'package:curalink/features/pharmacy/ui/screens/pharmacy_checkout.dart';
import 'package:curalink/features/pharmacy/ui/screens/pharmacy_checkout_thankyou.dart';
import 'package:curalink/features/pharmacy/ui/screens/product_details.dart';
import 'package:curalink/features/profile/ui/screens/profile.dart';
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScreen(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteConst.homeRoute,
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteConst.pharmacyRoute,
              path: '/pharmacy',
              builder: (context, state) => const Pharmacy(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteConst.appointmentScreenRoute,
              path: '/appointments',
              builder: (context, state) =>
              const AppointmentsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteConst.profileRoute,
              path: '/profile',
              builder: (context, state) => const Profile(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: AppRouteConst.topDoctorsRoute,
      path: "/topDocs",
      pageBuilder: (context, state)=> const MaterialPage(child: TopDoctors()),

    ),
    GoRoute(
      name: AppRouteConst.docDetailsRoute,
      path: "/docDetails",
      pageBuilder: (context, state)=> const MaterialPage(child: DoctorDetails()),

    ),
    GoRoute(
      name: AppRouteConst.appointmentSumRoute,
      path: "/appointmentSum",
      pageBuilder: (context, state)=> const MaterialPage(child: AppointmentSummary()),

    ),
    GoRoute(
      name: AppRouteConst.bookingConfirmationRoute,
      path: "/bookingConfirmation",
      pageBuilder: (context, state)=> const MaterialPage(child: BookingConfirmation()),

    ),
    GoRoute(
      name: AppRouteConst.videoCallRoute,
      path: "/videoCall",
      pageBuilder: (context, state){
        final String? docName = state.extra as String?;
        return MaterialPage(child: VideoCallScreen(doctorName: docName,));
      }
    ),
    GoRoute(
      name: AppRouteConst.productDScrnRoute,
      path: "/productDScrn",
      pageBuilder: (context, state){
        final String? heroTag = state.extra as String?;
        return MaterialPage(child: ProductDetailsScreen(heroTag: heroTag,));
      }
    ),
    GoRoute(
      name: AppRouteConst.cartScreenRoute,
      path: "/cartScreen",
      pageBuilder: (context, state)=> const MaterialPage(child: CartScreen()),
    ),
    GoRoute(
      name: AppRouteConst.pharmacyCheckOutScreenRoute,
      path: "/pharmacyCheckOutScreen",
      pageBuilder: (context, state)=> const MaterialPage(child: PharmacyCheckoutScreen()),
    ),
    GoRoute(
      name: AppRouteConst.pharmacyCheckOutThankYouScreenRoute,
      path: "/pharmacyCheckOutThankYou",
      pageBuilder: (context, state)=> MaterialPage(child: PharmacyCheckoutThankYouScreen()),
    ),
    GoRoute(
      name: AppRouteConst.blogArchiveRoute,
      path: "/blogArchive",
      pageBuilder: (context, state)=> MaterialPage(child: BlogArchive()),
    ),
    GoRoute(
      name: AppRouteConst.singlePostRoute,
      path: "/singlePost",
      pageBuilder: (context, state)=> MaterialPage(child: SingleBlogPage()),
    ),
  ]
);