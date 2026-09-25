import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/pharmacy/ui/widgets/plus_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.offerPrice,
    required this.onClick,
  });

  final String? offerPrice;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 118.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primaryColor.withAlpha(22)),
        ),
        child: Column(
          spacing: 8.h,
          children: [
            Image.asset(AssetsPath.bodrex, height: 74.h),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text("Bodrex Herbal", style: TextStyle(fontWeight: FontWeight.w700)),
                Text("100ml", style: TextStyle(color: AppColors.greyText)),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "\$15.99",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  offerPrice ?? "",
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                    color: AppColors.greyText,
                    decoration: TextDecoration.lineThrough,
                  ),

                ),
                PlusIconButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

