import 'package:flutter/material.dart';
import 'package:gp/const.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({required this.icon,
  required this.onTap,
  required this.title,
    super.key,
  });
final void Function()? onTap;
final IconData icon;
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(onTap:onTap ,child: Container(decoration:const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: opacitycolor2),top:BorderSide(width: 1,color: opacitycolor2))
         ),
         height: 50 ,width:double.infinity,child: Row(children: [const SizedBox(width: 10,),
           Icon(icon,color: color,) ,const SizedBox(width: 5,)
           ,Text(title,style:const TextStyle(fontSize: 16,color: color,fontWeight: FontWeight.w500),)
           
          ,const Spacer() ,const Icon(Icons.arrow_forward_ios,color: color,size: 15,),const SizedBox(width: 10,)
         ],),),),
    );
  }
}
