import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/home/ui/screens/home_screen.dart';
import 'package:curalink/features/home/ui/widgets/article_container.dart';
import 'package:curalink/features/home/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd4ebf3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 64.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Image.asset(AssetsPath.profile, width: 48.w,),
                        SizedBox(height: 14.h,),
                        Text("Welcome!", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
                        Text("Ruchita", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),),
                        SizedBox(height: 8.h,),
                        Text("How is it going today?",
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Image.asset(AssetsPath.homeDoc, width: 120.w,)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 30.w,
                right: 30.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: .start,
                    spacing: 20.w,
                    children: [
                      Expanded(child: CategoryItem(label: 'Top Doctors', iconPath: AssetsPath.topDocs, onTap: () {},)),
                      Expanded(child: CategoryItem(label: 'Pharmacy', iconPath: AssetsPath.topDocs, onTap: () {},)),
                      Expanded(child: CategoryItem(label: 'Ambulance', iconPath: AssetsPath.topDocs, onTap: () {},)),
                    ]
                  ),
                  SizedBox(height: 30.h,),
                  SectionHeader(),
                  SizedBox(height: 10.h,),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index)=> ArticleContainer(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  final String label;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 10.h,
        mainAxisSize: .min,
        children: [
          SvgPicture.asset(iconPath, width: 44.w, height: 44.h,),
          Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
          ),),
        ],
      ),
    );
  }
}
