import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailsShimmer extends StatelessWidget {
  const BookDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: _shimmerBox(width: double.infinity, height: 50, radius: 16),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.topRight,
            child: _shimmerBox(height: 40, width: 40, radius: 12),
          ),
          Align(
            alignment: Alignment.center,
            child: _shimmerBox(height: 340.h, width: 222.w, radius: 16),
          ),
          const SizedBox(height: 10),
          Align(
            child: _shimmerBox(height: 24, width: 200, radius: 4),
          ),
          const SizedBox(height: 5),
          Align(
            child: _shimmerBox(height: 20, width: 140, radius: 4),
          ),
          const SizedBox(height: 8),
          Align(
            child: _shimmerBox(height: 20, width: 80, radius: 4),
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StarShimmer(),
              _StarShimmer(),
              _StarShimmer(),
              _StarShimmer(),
              _StarShimmer(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _shimmerBox(width: 100, height: 40, radius: 20),
              const SizedBox(width: 10),
              _shimmerBox(width: 100, height: 40, radius: 20),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _shimmerBox(height: 20, width: 140),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24, top: 8),
            child: Column(
              children: List.generate(3, (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _shimmerBox(height: 14, width: double.infinity),
                );
              }),
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 68,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _shimmerBox(height: 32, width: 80, radius: 20),
                );
              },
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _shimmerBox(height: 20, width: 160),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24, top: 8),
            child: Column(
              children: List.generate(3, (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _shimmerBox(height: 14, width: double.infinity),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _shimmerBox(height: 20, width: 120),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, __) => _shimmerBox(height: 180, width: 120, radius: 12),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  static Widget _shimmerBox({
    required double height,
    required double width,
    double radius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

class _StarShimmer extends StatelessWidget {
  const _StarShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const Icon(
          Icons.star,
          size: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
