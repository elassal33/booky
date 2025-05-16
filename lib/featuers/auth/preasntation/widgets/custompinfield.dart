import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomPinField extends StatelessWidget {
  
  const CustomPinField({required this.onChanged,
    this.error,
    super.key,
  });
  final String?error;
final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Pinput(forceErrorState: true,errorText:error,
      separatorBuilder: (index) =>const SizedBox(width: 15),
    onChanged:onChanged,inputFormatters: [FilteringTextInputFormatter.digitsOnly], 
    defaultPinTheme: PinTheme(textStyle:const TextStyle(fontSize: 24,fontWeight: FontWeight.w600),
      height: 55.r,width: 55.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color:const Color.fromRGBO(219, 227, 241, 1),width:1 ),color: Colors.transparent)),
      length: 4,
    );
  }
}