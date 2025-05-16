
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class PurchasedItem extends StatelessWidget{
  const PurchasedItem({super.key,required this.book});

final BookModel book;

  @override
  Widget build(BuildContext context) {
    return        Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( decoration: BoxDecoration( color: Colors.white,boxShadow: [
      BoxShadow(
    
        color: opacitycolor2.withOpacity(0.3), // Shadow color
        blurRadius: 8, // Softness of the shadow
        spreadRadius: 4, // How much the shadow extends
        offset: Offset(0, 20), // Shadow position (x, y)
      ),
      ], 
        borderRadius: BorderRadius.circular(8),border: Border.all(width: 1,color: opacitycolor2)),
          
          width: 388.w,
          height:104.h,
          
          child: Row(children: [
       
      Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: SizedBox(height:80.h,width:80.w ,child : Image.network(book.cover)),
      ),
     Container( width:270.w ,
       child:    Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(book.title,maxLines: 2,style:const TextStyle(
             
             overflow: TextOverflow.ellipsis,
             fontWeight: FontWeight.w600,
           color: Colors.black
           ,fontSize: 16
           ),),
           Text(book.author.name,style: const TextStyle(
             fontWeight: FontWeight.w400,
           color: color
           ,fontSize: 12
           ),),
        ],
      ),
     )
      
      
      
          ],
      
      
      
          ),
        ),
    );
    
  }

}