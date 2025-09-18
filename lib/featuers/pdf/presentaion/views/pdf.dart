import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter/material.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/widgets/rate.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfs extends StatefulWidget{
  const Pdfs({super.key});

  


  @override
  State<Pdfs> createState() => _pdfsState();
}

class _pdfsState extends State<Pdfs> {
  bool _initialized = false;
  late  final BookModel book;
  Future<void> showrate(BookModel book) async {
    await Future.delayed(const Duration(seconds: 30));
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) =>  Rate(book:book ,),
      );
    }
  }
   @override
  void initState() {
    super.initState();
    _secureScreen();
  }

  @override
  void dispose() {
    _clearSecureScreen();
    super.dispose();
  }

  Future<void> _secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  Future<void> _clearSecureScreen() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }
@override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
    if (!_initialized) {
      book = ModalRoute.of(context)!.settings.arguments as BookModel;
      _initialized = true;
     if (!book.israted) {
         showrate(book);
     }
    }
  }
 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: book.pdf!=null? SfPdfViewer.network(book.pdf!):Center());
  }
}