import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotChip extends StatelessWidget {
  final String time;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const TimeSlotChip({
    super.key,
    required this.time,
    required this.isSelected,
    this.isDisabled = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isSelected ? Colors.blueAccent : Colors.white;

    final Color textColor = isSelected
        ? Colors.white
        : (isDisabled ? const Color(0xFFB4CCF4) : Colors.black87);

    final Color borderColor = isSelected
        ? Colors.blueAccent
        : (isDisabled ? const Color(0xFFB4CCF4) : Colors.blueAccent);

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor, width: 1.w),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: textColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}