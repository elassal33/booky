import 'package:flutter/material.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/views/bookdetailsbody.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    BookModel book = map['book'];
    String index = map['index'];

    return BookDetailsbody(
      book: book,
      index: index,
    );
  }
}
