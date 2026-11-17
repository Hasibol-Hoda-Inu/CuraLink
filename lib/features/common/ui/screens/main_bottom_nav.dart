import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.medication_outlined),
            selectedIcon: Icon(
              Icons.medication,
              color: AppColors.primaryColor,
            ),
            label: 'Pharmacy',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(
              Icons.calendar_month,
              color: AppColors.primaryColor,
            ),
            label: 'Appointments',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}