import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/common/ui/widgets/section_header.dart';

import 'package:curalink/features/pharmacy/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {

  List<String> offerPrices = [
    "\$10.99",
    "\$9.99",
    "\$12.99",
    "\$57.99",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pharmacy", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(22),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 12.h,
                      crossAxisAlignment: .start,
                      children: [
                        Text("Order quickly with Prescription",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(136.w, 30.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text("Upload prescription",
                              style: TextStyle(fontSize: 12.sp,)
                            )
                        )
                      ],
                    ),
                  ),
                  Image.asset(AssetsPath.phBanner, width: 90.w,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            SectionHeader(title: 'Popular Products', onClick: () {  },),
            SizedBox(height: 10.h,),
            SizedBox(
              height: 166.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)=> ProductCard(),
                separatorBuilder: (context, index)=> SizedBox(width: 20.w,),
                itemCount: 4,

              ),
            ),
            SizedBox(height: 20.h,),
            SectionHeader(title: 'Products on sale', onClick: () {  },),
            SizedBox(height: 10.h,),
            SizedBox(
              height: 166.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)=> ProductCard(offerPrice: offerPrices[index],),
                separatorBuilder: (context, index)=> SizedBox(width: 20.w,),
                itemCount: 4,

              ),
            ),
          ],
        ),
      ),
    );
  }
}


