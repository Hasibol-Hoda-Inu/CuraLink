import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && navigationShell.currentIndex != 0) {
          navigationShell.goBranch(
            0,
            initialLocation: true,
          );
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          height: 72.h,
          selectedIndex: navigationShell.currentIndex,
          backgroundColor: Colors.white,
          indicatorColor: AppColors.primaryColor.withValues(alpha: 0.12),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(AssetsPath.homeIcon, width: 24, height: 24,),
              selectedIcon: SvgPicture.asset(
                  AssetsPath.homeIconFilled,
                colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsPath.pharmacyIconNav, width: 24, height: 24,),
              selectedIcon: SvgPicture.asset(AssetsPath.pharmacyIconFilled,
                colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: 'Pharmacy',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsPath.appointmentIcon),
              selectedIcon: SvgPicture.asset(AssetsPath.appointmentIconFilled,
                colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: 'Appointments',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsPath.profileIcon,),
              selectedIcon: SvgPicture.asset(AssetsPath.profileIconFilled,
                colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}