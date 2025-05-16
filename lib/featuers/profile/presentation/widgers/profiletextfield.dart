

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/profile/presentation/manger/birthdatecubit/birthdatecubit.dart';




class ProfileTextField extends StatefulWidget{
 final String hint;
 final String? error;
 final int limit;
 final double width;
final TextEditingController lastname;
  final void Function(String?) onChanged;
 
 const ProfileTextField({required this.lastname,super.key, required this.width,this.error,required this.limit ,required this.hint,required this.onChanged});

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}
 
class _ProfileTextFieldState extends State<ProfileTextField> {
  TextEditingController _lastname=TextEditingController();
  DateTime? _birthday;
   void initState() {
    super.initState();
    // Set initial value as the "real editable text"
     _lastname=widget.lastname;
  }
  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme:const ColorScheme.light(
            primary: color, // Your custom blue
            onPrimary: Colors.white, // Text on primary color
            onSurface: Colors.black, // Default text color
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
    );

    if (pickedDate != null) {

      BlocProvider.of<BirthDateCubit>(context).pickvarbycalender(pickedDate.toLocal().toString().split(' ')[0]);
      setState(() {
        _birthday = pickedDate;
        _lastname.text=_birthday!.toLocal().toString().split(' ')[0];
      });
    }
  }

  


  @override
  Widget build(BuildContext context) {
    TextEditingController _lastname=widget.lastname;
  return  Padding(
    padding: const EdgeInsets.only(top: 8,bottom: 8),
    child: Container(    constraints: BoxConstraints(maxWidth: widget.width.w,minHeight: 55.h) ,
      child: TextFormField(inputFormatters: [
        LengthLimitingTextInputFormatter(widget.limit),
      ],controller: _lastname
     , style:const TextStyle(color: color)
        ,validator:widget.hint=='Birthdate'?null: (value) {
          if (value!.isEmpty) {
            return "this field is required";
          }
         else{
          return widget.error;
         }
        },
       
        onChanged:widget.onChanged,
        readOnly: widget.hint.toLowerCase().contains('birth') || widget.hint.toLowerCase().contains('email'),

          decoration: InputDecoration(errorText: widget.error,
           
     
          contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),filled: true,fillColor:Colors.transparent,
            suffixIcon: widget.hint.toLowerCase().contains('birth')
    ? IconButton(
        icon: Icon(Icons.calendar_month, color: color, size: 20),
        onPressed: _selectDate,
      )
    : null,
            hintStyle:const TextStyle(fontSize: 14,color: Color.fromRGBO(180 ,198 ,226,1),fontWeight: FontWeight.w400),
           enabledBorder:const OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(8)),  borderSide: BorderSide(color: opacitycolor2),),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), )
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