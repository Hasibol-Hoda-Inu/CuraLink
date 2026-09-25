import 'package:carousel_slider/carousel_slider.dart';
import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImgCarouselSlider extends StatefulWidget {
  const ProductImgCarouselSlider({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  State<ProductImgCarouselSlider> createState() => _ProductImgCarouselSliderState();
}

class _ProductImgCarouselSliderState extends State<ProductImgCarouselSlider> {

  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 260.0.h,
              viewportFraction: 1,
              onPageChanged: (currentIndex, reason){
                _valueNotifier.value = currentIndex;
              }
          ),
          items: widget.imageUrls.map((url) {
            return Builder(
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                        image: AssetImage(url),
                        fit: BoxFit.cover,
                      )
                  ),
                  alignment: Alignment.center,

                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    for(int i = 0; i< widget.imageUrls.length; i++)
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: value==i? AppColors.primaryColor : Colors.grey.shade300,
                      )
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}