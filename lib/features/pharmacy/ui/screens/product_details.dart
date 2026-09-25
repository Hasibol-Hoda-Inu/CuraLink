import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/pharmacy/ui/widgets/product_img_carousel_slider.dart';
import 'package:curalink/features/pharmacy/ui/widgets/product_quantity_stepper.dart';
import 'package:curalink/features/pharmacy/ui/widgets/product_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<String> imgUrls = [
    AssetsPath.topDocChamber,
    AssetsPath.blogBannerImg,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pharmacy", style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProductImgCarouselSlider(
            imageUrls: imgUrls,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 16.h,
                right: 20.w,
                bottom: 20.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Bodrex Herbal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                  )),
                              Text("75ml",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      color: AppColors.greyText
                                  )),
                              Text("\$99",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22.sp,
                                      color: AppColors.primaryColor
                                  )),
                              ProductReviewWidget(),
                            ],
                          ),
                        ),
                        ProductQuantityStepperWidget(onChange: (int value) {},)
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Text("Description", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp)),
                    SizedBox(height: 8.h,),
                    MarkdownBody(
                      data: "OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing",
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          fontSize: 14.sp,
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    ElevatedButton(onPressed: (){}, child: Text("Buy")),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
