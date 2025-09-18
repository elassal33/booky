import 'package:flutter/material.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/widgets/custombookbotton.dart';

class OpenBookBottons extends StatelessWidget {
  const OpenBookBottons({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BookBotton(
          onpressed: () => Navigator.pushNamed(context, '/pdf', arguments: book),
          name: 'read',
        ),
        const SizedBox(width: 10),
        BookBotton(
          onpressed: () => Navigator.pushNamed(context, '/bookrecord', arguments: book),
          name: 'listen',
        ),
      ],
    );
  }
}
