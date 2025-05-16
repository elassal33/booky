import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
   return DropdownButton<String>(
   
     hint: Text("Select Gender"),
   
     value: _selectedGender,
   
     onChanged: (String? newValue) {
   
       setState(() {
   
         _selectedGender = newValue;
   
       });
   
     },
   
     items: <String>['Male', 'Female', 'Other']
   
         .map<DropdownMenuItem<String>>((String value) {
   
       return DropdownMenuItem<String>(
   
         value: value,
   
         child: Text(value),
   
       );
   
     }).toList(),
   
   );
  }
}