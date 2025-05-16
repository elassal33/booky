
import 'package:flutter/material.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfs extends StatefulWidget{
  const Pdfs({super.key});

  


  @override
  State<Pdfs> createState() => _pdfsState();
}

class _pdfsState extends State<Pdfs> {
  late  final BookModel book;
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
     book=   ModalRoute.of(context)!.settings.arguments as BookModel;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: book.pdf!=null? SfPdfViewer.network(book.pdf!):Center());
  }
}