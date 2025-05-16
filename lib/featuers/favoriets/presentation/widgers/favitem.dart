import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/favoriets/presentation/widgers/favicon.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';



class Favitem extends StatelessWidget {
  const Favitem({required this.index,required this.book,
    super.key,
  });
  final BookModel book;
final int index; 


  @override
  Widget build(BuildContext context) {
  
    return Container(
     
    constraints:const BoxConstraints(  maxWidth: 120,
      maxHeight: 215,),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(15),
  
      ),
      child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
         
             Expanded(
               child: ClipRRect(
                borderRadius:const  BorderRadius.all(Radius.circular(12)),
                child: SizedBox(height:  160,width: 125,
                  child: Hero(tag: '$index f',
                    child: Image.network(fit: BoxFit.cover,
               
                book.cover
                 
                 
               ),
                  ),
                ),
                             ),
             ),
          
         Text(
            book.title,overflow: TextOverflow.ellipsis,
             maxLines: 1,
             
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
         Row( mainAxisAlignment: MainAxisAlignment.center,
            
           children: [
              Text(
             book.price,
             style: TextStyle(color: color,
               fontSize: 11.sp,
               height: 1,
               fontWeight:FontWeight.w400,
             ),
           ),
      const      Spacer(),
          const   
          SizedBox(width: 8,),
          FavIcon2(size: 16, id: book.id.toString(), isloved: true, index: index)
          ],
         )
        ],
      )
    );
  }
}
