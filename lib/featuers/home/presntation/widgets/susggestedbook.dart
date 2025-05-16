import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class SusggestedBook extends StatelessWidget {
  const SusggestedBook({
    super.key,required this.book,required this.index
  });
final BookModel book;
final String index;
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
                child: SizedBox(height:  136,width: 136,
                  child: Hero(tag: "$index s",
                    child: Image.network(
                      book.cover, 
                    fit: BoxFit.cover,
                    ),
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
        Text(
                 book.author.name,
                 style: TextStyle(color:color.withOpacity(0.5) ,
                   fontSize: 9.sp,
                   height: 1,
                   fontWeight: FontWeight.w400,
                 ),
               ),
          
          ],
        ),
      ),
    );
  }
}
