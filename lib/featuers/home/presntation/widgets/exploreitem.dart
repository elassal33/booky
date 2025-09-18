import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';

class Exploreitem extends StatelessWidget {
  const Exploreitem({required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(height: 143,width: 376,decoration: BoxDecoration(gradient:const LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [color3,color]),
       boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.6), // Shadow color
        blurRadius: 10, // Softness of the shadow
        spreadRadius: 0.5, // How much the shadow extends
        offset: Offset(0, 6), // Shadow position (x, y)
      ),
    ],   color: color,borderRadius: BorderRadius.circular(16)
      ),child: Stack(
        children: [
          Positioned(top: 20,left: 20,
            child: SizedBox(width: 250,height: 60,
              child: Text(text,maxLines: 3,style: TextStyle(overflow:TextOverflow.ellipsis,color:
               Colors.white,fontSize: 13.sp,fontWeight: FontWeight.w400),),
            ),
          )
          ,Positioned(bottom: 0,right: 0,child: Image.asset('assets/images/image 665.png'))
        ],
      ),),
    );
  }
}