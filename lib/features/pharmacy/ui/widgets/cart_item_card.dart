import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/pharmacy/ui/widgets/product_quantity_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.name,
    required this.variantLine,
    required this.price,
    this.badgeText = 'OTC',
    this.stockText = 'In Stock (Ready to dispatch)',
    this.onRemove,
  });

  final String name;
  final String variantLine;
  final double price;
  final String badgeText;
  final String stockText;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor.withAlpha(12)),
      ),
      child: Column(
        spacing: 16.h,
        children: [
          Row(
            crossAxisAlignment: .start,
            spacing: 12.w,
            children: [
              Image.asset(AssetsPath.bodrex, height: 80.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2.h,
                  children: [
                    Row(
                      spacing: 8.w,
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _buildBadge(badgeText),
                      ],
                    ),
                    Text(
                      variantLine,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.bodyText,
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                onPressed: onRemove,
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.bodyText,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: _buildStockIndicator(stockText)
              ),
              ProductQuantityStepperWidget(onChange: (_) {}, iconSize: 24.w,),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withAlpha(30),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10.sp, color: AppColors.primaryColor),
      ),
    );
  }

  Widget _buildStockIndicator(String text) {
    return Row(
      spacing: 4.w,
      children: [
        Icon(Icons.check_circle, color: Colors.teal, size: 14.sp),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }
}
