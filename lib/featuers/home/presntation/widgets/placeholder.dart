import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookItemPlaceholder extends StatelessWidget {
  const BookItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 120,
        maxHeight: 215,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 10.h,
              width: 80.w,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
            Container(
              height: 8.h,
              width: 60.w,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 2),
            ),
            
            Container(
              height: 10.h,
              width: 40.w,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 4),
            ),
          ],
        ),
      ),
    );
  }
}
