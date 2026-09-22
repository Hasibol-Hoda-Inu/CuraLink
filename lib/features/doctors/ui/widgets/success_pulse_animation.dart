import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessPulseAnimation extends StatefulWidget {
  const SuccessPulseAnimation({super.key});

  @override
  State<SuccessPulseAnimation> createState() => _SuccessPulseAnimationState();
}

class _SuccessPulseAnimationState extends State<SuccessPulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value;

        // Wrap the Stack in a fixed-size SizedBox to prevent layout shifts!
        return SizedBox(
          width: 140.w,
          height: 140.w,
          child: Stack(
            alignment: Alignment.center, // Keeps the expanding rings perfectly centered
            children: [
              // Outer Pulsing Ring
              Container(
                width: 80.w + (progress * 60.w),
                height: 80.w + (progress * 60.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00A859).withAlpha((76 * (1 - progress)).toInt()),
                ),
              ),

              // Middle Pulsing Ring
              Container(
                width: 80.w + (progress * 30.w),
                height: 80.w + (progress * 30.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00A859).withAlpha((102 * (1 - progress)).toInt()),
                  border: Border.all(
                    color: const Color(0xFF00A859).withAlpha((127 * (1 - progress)).toInt()),
                    width: 1.w,
                  ),
                ),
              ),

              // Inner Static Solid Circle
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF00C875),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00C875).withAlpha(102),
                      blurRadius: 12.r,
                      spreadRadius: 2.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 44.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}