import 'package:flutter/material.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/widgets/bookdetailreadybody.dart';


class Bookdetailsready extends StatefulWidget {
  const Bookdetailsready({
    super.key,
    required this.book,
    required this.index,
  });

  final BookModel book;
  final String index;

  @override
  State<Bookdetailsready> createState() => _BookdetailsreadyState();
}

class _BookdetailsreadyState extends State<Bookdetailsready> {


  @override
  void initState() {

    super.initState();
    
  }

 

  @override
  Widget build(BuildContext context) {

  
        return BookDetailsreadybody(
          book: widget.book,
          index: widget.index,
         
        );
     
  }
}
