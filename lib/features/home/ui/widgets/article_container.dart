import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: .start,
        spacing: 10.w,
        children: [
          Image.asset(AssetsPath.article01, width: 54.w, height: 52.h,),
          Expanded(
            child: Column(
              spacing: 6.h,
              crossAxisAlignment: .start,
              children: [
                Text("The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
                Wrap(
                  spacing: 10.w,
                  children: [
                    Text("December 21, 2026",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),),
                    Text("5 min read",
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey)
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){},
              icon: Icon(Icons.bookmark_border_rounded,
                color: AppColors.primaryColor,
              ))
        ],
      ),
    );
  }
}