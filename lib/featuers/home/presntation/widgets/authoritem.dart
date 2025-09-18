import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class Authoritem extends StatelessWidget {
  const Authoritem({
    super.key,required this.author
  });
final Author author;
  @override
  Widget build(BuildContext context) {
    return     Padding(
    
      padding: const EdgeInsets.only(left: 8,right: 8),
    
      child:   Container( width: 70.w,
        child: Column(children: [
            
        
            
          CircleAvatar(backgroundImage: NetworkImage(author.image),radius: 25.r,),
            
        
            
          SizedBox(height: 8.h,),
            
        
            
          Text( overflow: TextOverflow.ellipsis, author.name,style: TextStyle(color:Colors.grey ,fontSize: 10.sp,fontWeight: FontWeight.w700),)
            
        
            
        
            
        
            
        ],),
      ),
    
    );
  }
}