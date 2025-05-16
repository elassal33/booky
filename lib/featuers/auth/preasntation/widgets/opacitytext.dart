import 'package:flutter/material.dart';
import 'package:gp/const.dart';

class OpacityText extends StatefulWidget {
 final String name;
final  double fontSize;
final  FontWeight fontWeight;
  const OpacityText({super.key,required this.name,required this.fontSize,required this.fontWeight});

  @override
  State<OpacityText> createState() => _OpacityTextState();
}

class _OpacityTextState extends State<OpacityText> {
  double opacity=1.0;
  @override
  
  Widget build(BuildContext context) {
  return GestureDetector(
    onPanEnd: (_) => setState(() => opacity = 1.0), // Reset if user swipes away
        onPanCancel: () => setState(() => opacity = 1.0),

  onTapDown: (_) {setState(() => opacity = 0.5);}, 
  onTapUp: (_) {
    setState(() => opacity = 1.0);
    switch (widget.name) {
  case 'Sign up':
    Navigator.pushReplacementNamed(context, '/${widget.name}');
    break;
  case 'Login':
    Navigator.pushReplacementNamed(context, '/${widget.name}');
    break;
  case 'Forget Password?':
  Navigator.pushNamed(context, '/Forget Password');
    break;
  default:
}
  } ,  
  
  child: AnimatedOpacity(
    duration:const Duration(milliseconds: 200),
    opacity: opacity,
    child: 
         Text(widget.name,style: TextStyle(color: color,fontSize: widget.fontSize,fontWeight: widget.fontWeight),),
  ),
);
  }
}