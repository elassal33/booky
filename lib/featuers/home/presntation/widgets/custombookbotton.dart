import 'package:flutter/material.dart';
import 'package:gp/const.dart';


class BookBotton extends StatelessWidget {
  const BookBotton({
    super.key,
    required this.onpressed,
    required this.name,
   
  });

  final void Function()? onpressed;
  final String name;
  

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(color),
          side: MaterialStateProperty.all(
            const BorderSide(color: color, width: 1),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(150, 48,)),
          maximumSize: MaterialStateProperty.all(Size(150, 48)),
        ),
        onPressed: onpressed,
        child:Text(name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600)));
  }
}
/*,Container( width: width*0.9,height: 40,
      decoration: BoxDecoration(border:Border.all(width: 1,color: color),borderRadius: BorderRadius.circular(8) ),
      child:const Center(child:  Text('login' ,style: TextStyle(color: color,fontSize: 16,fontWeight: FontWeight.w700 ),)),
    )
    , const SizedBox(height: 16,)
    ,Container( width: width*0.9,height: 40,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(8) ),
      child:const Center(child:  Text('Sign up' ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700 ),)),
    ),*/