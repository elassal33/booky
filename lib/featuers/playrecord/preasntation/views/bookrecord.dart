import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/playrecord/preasntation/widgets/slider.dart';

class BookRecord extends StatefulWidget{
  const BookRecord({super.key});

  @override
  State<BookRecord> createState() => _BookRecordState();
}

class _BookRecordState extends State<BookRecord> {
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
return  Scaffold(
    appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
  body: Column( 
  children: [
   const SizedBox(height: 100,),
Align(alignment: Alignment.center,
  child:   Container( decoration:const BoxDecoration(boxShadow: [
  
        BoxShadow(
  
      
  
          color: Color.fromRGBO(161, 184, 193 ,0.5), // Shadow color
  
          blurRadius: 8, // Softness of the shadow
  
          spreadRadius: 4, // How much the shadow extends
  
          offset: Offset(0, 12), // Shadow position (x, y)
  
        ),
  
        ],  ),height: 325.h,width: 320.w,
  
                    child: ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.network(book.cover,
  
                             fit: BoxFit.cover,)),
  
                  ),
),
const  SizedBox(height: 30,)
            ,Align(
              child: Text(
                book.title,overflow: TextOverflow.ellipsis,
                maxLines: 2,
                
                style: TextStyle(color: color,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
         const   SizedBox(height: 40,)
            
     , Align(
        child: Text(
                 book.author.name,
                 style: TextStyle(color:opacitycolor2 ,
                   fontSize: 16.sp,
                   height: 1,
                   fontWeight: FontWeight.w500,
                 ),
               ),
      ),
 book.record!=null? AudioPlayerScreen(recored: book.record!,):Center()
  ],),
);
  }
}