import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/core/utilits/customtextfield.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilesates.dart';
import 'package:gp/featuers/profile/presentation/widgers/profilebotton.dart';

class Contactusbody extends StatefulWidget {
  const Contactusbody({
    super.key,
  });

  @override
  State<Contactusbody> createState() => _ContactusbodyState();
}

class _ContactusbodyState extends State<Contactusbody> {
  final _formKey = GlobalKey<FormState>();
  String? emailerror;
    String? nameerror;

    Map? errors;
  late String? email;
  late String? name;
  late String? message;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocConsumer<EditeprofileCubit, EditeProfileStates>(
      listener: (context, state) {
         if (state is EditDone) {
           showSuccessDialog(context);
         }
         if (state is EditLoading) {
           print('loading');
         }
          if (state is EditFiald) {
          errors=BlocProvider.of<EditeprofileCubit>(context).errors;
          print(errors);
          if (errors!=null) {
            extractStrings(errors!);
          }
          else{
 emailerror=BlocProvider.of<EditeprofileCubit>(context).message;
 nameerror=emailerror;
          }
          }
        },
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            children: [
              Text('Contact Us',
                  style: TextStyle(
                      color: color2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10.r),
              Text(
                  'We’re here to help! Send us your query via the form below or send us an email at helpdesk@gstudio.com for any issue you’re facing',
                  style: TextStyle(
                      color: color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 20.r),
              Text('your name',
                  style: TextStyle(
                      color: color2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              CustomTextField(
                  limit: 20,
                  width: 360,
                  hint: 'name',error: nameerror,
                  onChanged: (p0) {
                    name = p0;
                  }),
              Text('your email',
                  style: TextStyle(
                      color: color2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              CustomTextField(
                limit: 20,
                width: 360,
                hint: 'email',error: emailerror,
                onChanged: (p0) {
                  email = p0;
                },
              ),
              Text('your message',
                  style: TextStyle(
                      color: color2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              CustomTextField(
                  limit: 20,
                  width: 360,
                  hint: '',
                  maxlines: 10,
                  onChanged: (p0) {
                    message = p0;
                  }),
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: ProfileBotton(
                      onpressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<EditeprofileCubit>(context)
                              .contactus(
                                  email: email!,
                                  message: message!,
                                  name: name!);
                        }
                      },
                      name: 'submit'))
            ],
          );
        },
      ),
    );
  }
  extractStrings(Map map) {
  setState(() {

 emailerror = map['email']?.join(', ') ;
  nameerror = map['name']?.join(', ') ;
  });

  
}
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismiss on tap outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 50),
              const SizedBox(height: 20),
              const Text(
                "SUCCESS",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Thank you for your request.\nWe are working hard to find the best service and deals for you.\n\nShortly you will find a confirmation in your email.",
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontSize: 14),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
