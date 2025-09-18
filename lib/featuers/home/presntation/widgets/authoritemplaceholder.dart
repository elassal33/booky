import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AuthorItemPlaceholder extends StatelessWidget {
  const AuthorItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            // Circular avatar placeholder
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Name placeholder
            Container(
              width: 40,
              height: 10,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
