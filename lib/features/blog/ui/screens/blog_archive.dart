import 'package:curalink/application/assets_path.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/blog/ui/widgets/health_tips_card.dart';
import 'package:curalink/features/blog/ui/widgets/post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BlogArchive extends StatefulWidget {
  const BlogArchive({super.key});

  @override
  State<BlogArchive> createState() => _BlogArchiveState();
}

class _BlogArchiveState extends State<BlogArchive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Articles",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Popular Articles",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              Text("Medically reviewed patient insights"),
              SizedBox(height: 12.h),
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 222.h,
                  crossAxisSpacing: 10.h,
                ),
                itemBuilder: (context, index) => PostContainer(onClick: toSinglePost),
              ),
              SizedBox(height: 18.h),
              Text(
                "Recommended by Doctors",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              Text("Bite-sized clinical advisory tips"),
              SizedBox(height: 12.h),
              SizedBox(
                height: 202.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => HealthTipsCard(
                    categoryIcon: Icons.water_drop_outlined,
                    category: 'Hydration',
                    title: 'The 2.5L Hydration Metric',
                    description:
                        'Clinical hydration supports cellular nutrient transport and regulates',
                    author: 'By Dr. Alvarez',
                    onClick: () {},
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toSinglePost(){
    GoRouter.of(context).pushNamed(AppRouteConst.singlePostRoute);
  }
}
