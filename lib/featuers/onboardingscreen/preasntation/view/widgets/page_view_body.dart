import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';

/*class PageViewBody extends StatelessWidget {

 final double height;
 final double width;
 final String image;
 final String text;
 const PageViewBody({super.key,required this.image,required this.text,required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
return Column(
  children: [
        SizedBox(width:width ,height:height,child: Image.asset(image,fit: BoxFit.cover,)),
Expanded(child: Image.asset(text))
  ],
);
  }
}*/
class PageViewBody extends StatelessWidget {


 final String image;
 final String text1;
 final String text2;
 final String text3;
 final String text4;
 const PageViewBody({super.key,required this.image,required this.text1,required this.text2,required this.text3,required this.text4,});
  @override
  Widget build(BuildContext context) {
return Column( mainAxisAlignment: MainAxisAlignment.center,

  children: [


SizedBox(height: 100.h,),
      Image.asset(image,width: 412.w,height: 500.h,),
         Text(text1,style:const TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.w600),),
    
     SizedBox(height: 10.r,),
    
       Padding(
         padding:  EdgeInsets.only(left: 8.r,right: 6.r),
         child:   Text(text2,style: TextStyle(color: color,fontSize: 16.sp,fontWeight: FontWeight.w400),),
       )
      , Padding(
         padding:  EdgeInsets.only(left: 8.r,right: 6.r),
         child:   Text(text3,style: TextStyle(color: color,fontSize: 16.sp,fontWeight: FontWeight.w400),),
       )
      , Padding(
         padding:  EdgeInsets.only(left: 8.r,right: 6.r),
         child:   Text(text4,style: TextStyle(color: color,fontSize: 16.sp,fontWeight: FontWeight.w400),),
       )





  ],

);
  }
}