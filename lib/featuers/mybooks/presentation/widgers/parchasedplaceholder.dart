import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PurchasedItemShimmer extends StatelessWidget {
  const PurchasedItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.grey[200]!),
          ),
          width: 388.w,
          height: 104.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  color: Colors.white, // Will be shimmered
                ),
              ),
              Container(
                width: 270.w,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200.w,
                      height: 16.h,
                      color: Colors.white, // Title placeholder
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 150.w,
                      height: 12.h,
                      color: Colors.white, // Author placeholder
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}