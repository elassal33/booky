import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CostumSocialButton extends StatelessWidget {
  const CostumSocialButton({
    super.key,
   
required this.onpressed,
    required this.name,
    required this.image,
  });
final String image;
final void Function()? onpressed;
 
  final String name;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(style: ButtonStyle(side: MaterialStateProperty.all(
      const BorderSide(color: Color.fromARGB(255, 90, 88, 88), width: 0.1),
    ),shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

  ),minimumSize:MaterialStateProperty.all(Size(247.w, 45)) ,maximumSize:MaterialStateProperty.all(Size(274.w, 45)) , ),
  onPressed:onpressed, child:Row(children: [Image.asset(image) ,const SizedBox(width: 10,),Text(name ,style: TextStyle(color:name=='continue with google'?Colors.black: Colors.blue,fontSize: 14,fontWeight: FontWeight.w400 ) )],));
  }
}