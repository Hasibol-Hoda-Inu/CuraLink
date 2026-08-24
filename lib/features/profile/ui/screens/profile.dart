import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/profile/ui/widgets/health_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List<Map<String, dynamic>> profileOptions = [
    {"icon": AssetsPath.profileIcon1, "title" : "My Saved"},
    {"icon": AssetsPath.profileIcon2, "title" : "Appointment"},
    {"icon": AssetsPath.profileIcon3, "title" : "Payment Method"},
    {"icon": AssetsPath.profileIcon4, "title" : "FAQs"},
    {"icon": AssetsPath.profileIcon5, "title" : "Logout"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 40.h,),
            Image.asset(AssetsPath.profile, width: 90.w,),
            Text("Ruchita", style: TextStyle(fontWeight: FontWeight.w700,),),
            SizedBox(height: 20.h,),
            HealthStatus(),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index)
                  {
                    Map<String, dynamic> item = profileOptions[index];
                    return ProfileOptList(iconPath: item["icon"]!, title: item['title'], onClick: () {},);
                  },
                  separatorBuilder: (context, index)=>
                      Divider(height: 1.h, color: AppColors.primaryColor.withAlpha(32),),
                  itemCount: profileOptions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptList extends StatelessWidget {
  const ProfileOptList({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onClick,
  });

  final String iconPath;
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(iconPath, width: 42.w),
      title: Text(title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyText,),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12.h),
    );
  }
}
