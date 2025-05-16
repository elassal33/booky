

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';



class NewPasswordTextField extends StatefulWidget{
 final String hint;
 final String? error;
 final int limit;
 final Color ?backgroundColor;
 
  final void Function(String?) onChanged;
 
 const NewPasswordTextField({super.key, this.backgroundColor,this.error,required this.limit ,required this.hint,required this.onChanged});

  @override
  State<NewPasswordTextField> createState() => _NewPasswordTextFieldState();
}

class _NewPasswordTextFieldState extends State<NewPasswordTextField> {
   bool _isObscured=true;
  @override
  Widget build(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.only(top: 8,bottom: 8),
    child: Container(    constraints: BoxConstraints(minHeight:55.h, minWidth: 360.w) ,
      child: TextFormField(inputFormatters: [
        LengthLimitingTextInputFormatter(widget.limit),
      ]
        ,validator: (value) {
          if (value!.isEmpty) {
            return "this field is required";
          }
          return'done';
        },
        obscureText: _isObscured,
        onChanged:widget.onChanged,
          decoration: InputDecoration(errorText: widget.error,suffixIcon: GestureDetector(
             child:  Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: color,
              ),
              onTap: () {
                setState(() {
                  _isObscured = !_isObscured; 
                });
              },
            ),
          contentPadding:
                  const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  top: 8.0),filled: true,fillColor:widget.backgroundColor,
            hintText: widget.hint,
            hintStyle:const TextStyle(fontSize: 14,color: Color.fromRGBO(180 ,198 ,226,1),fontWeight: FontWeight.w400),
           enabledBorder: OutlineInputBorder(borderRadius:const BorderRadius.all(Radius.circular(16)),  borderSide: BorderSide(color:widget.backgroundColor==Colors.transparent? const Color.fromARGB(255, 90, 88, 88):Colors.white,width: 0.1),),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)), )
          ),
        ),
    ),
  );
  }
}



/*suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured; // Toggle password visibility
                });
              },
            ),*/