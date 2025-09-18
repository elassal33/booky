import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class Stars extends StatelessWidget {
  const Stars({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        book.rate,
        (index) => const Icon(Icons.star, size: 20, color: startscolor),
      ),
    );
  }
}

