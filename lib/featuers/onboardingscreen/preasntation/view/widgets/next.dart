import 'package:flutter/material.dart';
import 'package:gp/const.dart';

class CustomNext extends StatelessWidget {
  const CustomNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(decoration:const BoxDecoration(color:color,shape: BoxShape.circle),height:45 ,width:45,child:const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,));
  }
}