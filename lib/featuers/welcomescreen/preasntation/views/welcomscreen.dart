import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/welcomescreen/preasntation/widgets/costumauthbotton.dart';


class WelcomScreen extends StatelessWidget {



 const WelcomScreen({super.key,});
  @override
  Widget build(BuildContext context) {

return Scaffold(
 body:   Center(
   child: Column( 
    
    
    
      children: [
    SizedBox(height:91.h,),
   Image.asset('assets/images/cuate.png',width: 412.w,height: 458.h,),
    
          
    SizedBox(height: 10.r),
      
     const   Text('Welcome To Our App ',style: TextStyle(color: color,fontSize: 25,fontWeight: FontWeight.w700),),
    
     SizedBox(height: 20.r,),
    
       Padding(
         padding:  EdgeInsets.only(left: 8.r,right: 6.r),
         child:   Text('Take the first step on your journey to find all the ',style: TextStyle(color: color,fontSize: 16.sp,fontWeight: FontWeight.w400),),
       )
      , Padding(
         padding:  EdgeInsets.only(left: 8.r,right: 6.r),
         child:   Text('books you need. Get started today!',style: TextStyle(color: color,fontSize: 16.sp,fontWeight: FontWeight.w400),),
       )
       , SizedBox(height:73.h,)
    
    ,

    CostumAuthBotton(width: 412.w,name: 'login',)
    ,CostumAuthBotton(width: 412.w,name: 'sign up',)
    
    
    
    
    
    
    
    
    
    
    
      ],
    
    
    
    ),
 ),
);
  }
}

