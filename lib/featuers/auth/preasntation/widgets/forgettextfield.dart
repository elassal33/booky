import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgetTextField extends StatelessWidget{
 final int limit;
 final String? error;
  final ValueChanged<String>? onChanged;
 const ForgetTextField({super.key, required this.limit,this.error ,this.onChanged});
  @override
  Widget build(BuildContext context) {
  return  Padding(
    padding:  EdgeInsets.only(top: 4,bottom: 24.r),
    child: Container(constraints: BoxConstraints(minHeight:65.h,minWidth: 370.w ),
      child: TextFormField(inputFormatters: [
        LengthLimitingTextInputFormatter(limit),
      ]
        ,validator: (value) {
          if (value!.isEmpty) {
            return "this field is required";
          }
       else{
        return null;
       }
         
        },
        onChanged:onChanged,
          decoration: InputDecoration(errorText: error,
            
       enabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),  borderSide: BorderSide(color: Colors.blue,width: 0.5),),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), )
          ),
        ),
    ),
  );
  }

}
