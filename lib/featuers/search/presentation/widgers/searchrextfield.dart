import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';



class SearchTextField extends StatefulWidget{
 final String hint;
 final double width;
 final int limit;
 final String? error;

final void Function(String?)? onChanged;
 const SearchTextField({super.key, required this.limit ,this.error,required this.width,required this.hint,this.onChanged});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  
  @override
  Widget build(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.only(top: 8,bottom: 0),
    child: Container( constraints: BoxConstraints(minHeight:55.h, ) ,
    width: widget.width,
      child: TextFormField(inputFormatters: [
        LengthLimitingTextInputFormatter(widget.limit),
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
        
          decoration: InputDecoration(prefixIcon: Icon(Icons.search,color:  Color.fromRGBO(180 ,198 ,226,1),),errorText: widget.error, contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10,vertical: 10
                 ),filled: true,fillColor:const Color.fromRGBO(231, 237, 246, 1),
            hintText: widget.hint,
            hintStyle:const TextStyle(fontSize: 14,color: Color.fromRGBO(180 ,198 ,226,1),fontWeight: FontWeight.w400),
           enabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)),  borderSide: BorderSide(color: Colors.white,width: 1),),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)), )
         , focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: color))
          ),
        ),
    ),
  );
  }
}
