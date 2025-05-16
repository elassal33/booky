import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
class BirthdayPicker extends StatefulWidget {
  const BirthdayPicker({super.key});

  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  DateTime? _birthday;

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
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
      setState(() {
        _birthday = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
         Padding(
           padding:  EdgeInsets.only(top: 30.h),
           child: SizedBox( height: 70.h,width: 150.w,
             child: Column(
              
              children: [
                
                 SizedBox( height: 40.h,width: 140.w,
                   child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),  
                    onPressed: _selectDate,
                    child: Center(child: Text("Select Birthday")),
                               ),
                 ),
                SizedBox(height: 5),
                Text(
                  _birthday == null
                      ? "No date selected"
                      : "Birthday: ${_birthday!.year}-${_birthday!.month.toString().padLeft(2, '0')}-${_birthday!.day.toString().padLeft(2, '0')}",
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: color),
                ),
                
               
              ],
                   ),
           ),
         );
      
    
  }
}