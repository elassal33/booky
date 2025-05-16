import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TabBarPlaceholder extends StatelessWidget {
  const TabBarPlaceholder({
    super.key,
    this.tabCount = 3,
    this.isScrollable = false,
  });

  final int tabCount;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabCount,
      child: TabBar(
        isScrollable: isScrollable,
        indicatorColor: Colors.transparent,
        tabs: List.generate(
          tabCount,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
