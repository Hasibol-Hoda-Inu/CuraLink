import 'package:curalink/application/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantityStepperWidget extends StatefulWidget {
  const ProductQuantityStepperWidget({super.key, required this.onChange});
  final Function(int) onChange;

  @override
  State<ProductQuantityStepperWidget> createState() =>
      _ProductQuantityStepperWidgetState();
}

class _ProductQuantityStepperWidgetState
    extends State<ProductQuantityStepperWidget> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        IconButton.filledTonal(
          onPressed: _decrement,
          style: IconButton.styleFrom(
              backgroundColor: _count == 1 ? AppColors.primaryColor.withValues(alpha: 0.4) : AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
          ),
          icon: Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Text(
          "$_count",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        IconButton.filledTonal(
          onPressed: _increment,
          style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
          ),
          icon: const Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }

  void _increment() {
    _count++;
    widget.onChange(_count);
    setState(() {});
  }

  void _decrement() {
    if (_count > 1) {
      _count--;
      widget.onChange(_count);
      setState(() {});
    }
  }
}
