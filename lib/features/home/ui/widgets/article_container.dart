import 'package:curalink/application/app_colors.dart';
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
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primaryColor.withAlpha(28)),
      ),
      child: Row(
        crossAxisAlignment: .start,
        spacing: 10.w,
        children: [
          Container(
            width: 64.w,
            height: 62.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withAlpha(38),
              borderRadius: BorderRadius.circular(12.sp),

            ),
          ),
          //Image.asset(AssetsPath.article01, width: 64.w, height: 62.h,),
          Expanded(
            child: Column(
              spacing: 6.h,
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
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