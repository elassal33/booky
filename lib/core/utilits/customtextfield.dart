import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';


class CustomTextField extends StatefulWidget{
 final String hint;
 final double width;
 final int limit;
 final String? error;
 final int? maxlines;

final void Function(String?)? onChanged;
 const CustomTextField({super.key,  this.maxlines,required this.limit ,this.error,required this.width,required this.hint,this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured=true;
  @override
  Widget build(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.only(top: 8,bottom: 8),
    child: Container( constraints: BoxConstraints(minHeight:55.h, ) ,
    width: widget.width,
      child: TextFormField(maxLines: widget.maxlines==null?1:10,inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxlines==null? widget.limit:100),
      ]
      ,validator: (value) {
       
  if (value!.isEmpty) {
        return 'this field is reuired';
      }
      else{
        return null;
      }
        },
        
        onChanged: widget.onChanged,
        obscureText: widget.hint.contains('Password')? _isObscured:false,
          decoration: InputDecoration(errorText: widget.error,errorMaxLines:4,suffixIcon:widget.hint.contains('Password')? GestureDetector(
             child:  Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: color,
              ),
              onTap: () {
                setState(() {
                  _isObscured = !_isObscured; 
                });
              },
            ):null,
            contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10,vertical: 10
                 ),filled: true,fillColor:const Color.fromRGBO(231, 237, 246, 1),
            hintText: widget.hint,
            hintStyle:const TextStyle(fontSize: 14,color: Color.fromRGBO(180 ,198 ,226,1),fontWeight: FontWeight.w400),
           enabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)),  borderSide: BorderSide(color: Colors.white,width: 1),),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)), )
         ,focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: color))
          ),
        ),
    ),
  );
  }
}
