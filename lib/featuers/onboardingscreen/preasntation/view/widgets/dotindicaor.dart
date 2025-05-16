import 'package:flutter/material.dart';
import 'package:gp/const.dart';

class CustomDotIndicator extends StatelessWidget {
final  bool isactive;
  const CustomDotIndicator({
    required this.isactive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration:const Duration(milliseconds: 500),width:isactive? 30:7,height: 7,decoration: BoxDecoration(borderRadius:BorderRadius.circular(5), color:isactive? color:const Color.fromRGBO(207,218,236,1)),);
  }
}