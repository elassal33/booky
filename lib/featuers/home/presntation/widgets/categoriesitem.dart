import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';


class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // Removed fixed width to allow expansion
          height: 32,
          decoration: BoxDecoration(
            color: opacitycolor2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 4, // Extra bottom space (3px + 1px from vertical padding)
              top: 1,   // Minimal top space
              left: 1,
              right: 1,
            ),
            child: Container(
              constraints: BoxConstraints(minWidth: 66), // Minimum width
              padding: const EdgeInsets.symmetric(
                horizontal: 8,  // Increased from 4 for better text spacing
                vertical: 1,   // Minimal vertical padding
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: color,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}