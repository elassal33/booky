import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordcubit.dart';
import 'package:gp/featuers/auth/preasntation/widgets/forgetbutton.dart';
import 'package:gp/featuers/auth/preasntation/widgets/newpasswordtextfield.dart';

class ChangePassBody extends StatefulWidget {
  const ChangePassBody({
    required this.passtoken,
    super.key,
  });
  final String passtoken;

  @override
  State<ChangePassBody> createState() => _ChangePassBodyState();
}

class _ChangePassBodyState extends State<ChangePassBody> {
  String? password;
  String? passerror;
 Map ?errors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
              if (state is Serverproblem) {
        
          Popups().showFailDialog(context);
        }
         if (state is Done) {
            Navigator.of(context).pushNamedAndRemoveUntil( '/Login', 
              (Route<dynamic> route) => false, 
);
         }
             if (state is Fiald) {
          errors=BlocProvider.of<AuthCubit>(context).error;
          if (errors!=null) {
            extractStrings(errors!);
          }
          else{
 passerror=BlocProvider.of<AuthCubit>(context).message;
 
          }
         
          
          
         
         
        }
          },
          builder: (context, state) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              children: [
                Text('Set a new password',
                    style: TextStyle(
                        color: color2,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10.r),
                Text(
                    'Create a new password. Ensure it differs from previous ones for securit',
                    style: TextStyle(
                        color: color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 20.r),
                Text('New password',
                    style: TextStyle(
                        color: color2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
                NewPasswordTextField(error: passerror,
                  onChanged: (input) {
                    BlocProvider.of<ForgetPasswordCubit>(context).password =input;
                    BlocProvider.of<ForgetPasswordCubit>(context)
                        .onequal(input);
                        password=input;
                  },
                  backgroundColor: Colors.transparent,
                  hint: 'Password',
                  limit: 30,
                ),
                Text('Confirm Password',
                    style: TextStyle(
                        color: color2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
                NewPasswordTextField(error: passerror,
                  onChanged: (input) {
                    BlocProvider.of<ForgetPasswordCubit>(context)
                        .confirmpassword = input;
                    BlocProvider.of<ForgetPasswordCubit>(context)
                        .onequal(input);
                  },
                  backgroundColor: Colors.transparent,
                  hint: 'Re-enter password',
                  limit: 30,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ForgetButton(
                  isLoading: state is Loading,
                  label: 'Update Pasword',
                  onPressed: () async {
                    await BlocProvider.of<AuthCubit>(context)
                        .resetPassword(password!, widget.passtoken);
                  },
                )
              ],
            );
          },
        ));
  }
  extractStrings(Map map) {
  setState(() {

  passerror = map['password']?.join(', ') ;
  });

  
}
}
