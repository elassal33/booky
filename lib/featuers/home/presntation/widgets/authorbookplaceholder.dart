import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AuthorbookShimmer extends StatelessWidget {
  const AuthorbookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 120,
            maxHeight: 150,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Container(
                  height: 170,
                  width: 170,
                  color: Colors.white, // This will be shimmered
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 120,
                height: 12,
                color: Colors.white, // This will be shimmered
              ),
              const SizedBox(height: 4),
              Container(
                width: 80,
                height: 10,
                color: Colors.white, // This will be shimmered
              ),
            ],
          ),
        ),
      ),
    );
  }
}