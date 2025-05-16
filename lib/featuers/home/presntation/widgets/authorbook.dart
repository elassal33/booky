import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class Authorbook extends StatelessWidget {
  const Authorbook({
    super.key,required this.book
  });
final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       
      constraints:const BoxConstraints(  maxWidth: 120,
        maxHeight: 150,),
        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(15),
         /* boxShadow:const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset:  Offset(0, 4),
            ),
          ],*/
        ),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
           
               ClipRRect(
                borderRadius:const  BorderRadius.all(Radius.circular(8)),
                child: SizedBox(height:  170,width: 170,
                  child: Image.network(
                    book.cover, 
                  fit: BoxFit.cover,
                  ),
                ),
                             ),
            
           Text(
                book.title,overflow: TextOverflow.ellipsis,
                maxLines: 2,
                
                style: TextStyle(color: color,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
        
          ],
        ),
      ),
    );
  }
}
