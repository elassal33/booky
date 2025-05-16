import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordcubit.dart';
import 'package:gp/featuers/auth/preasntation/widgets/forgetbutton.dart';
import 'package:gp/featuers/auth/preasntation/widgets/forgettextfield.dart';

class ForgetPassBody extends StatefulWidget {
  const ForgetPassBody({
    super.key,
  });

  @override
  State<ForgetPassBody> createState() => _ForgetPassBodyState();
}

class _ForgetPassBodyState extends State<ForgetPassBody> {
  Map ?errors;
  String? emailerror;
  String? email;
  String? verificationtoken;
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
            if (state is Done) {
              print('this is  $verificationtoken');
             Navigator.pushNamed(context, '/otp code',arguments: verificationtoken); 
             
            }
             if (state is Fiald) {
          
          errors=BlocProvider.of<AuthCubit>(context).error;
          extractStrings(errors!);
          
         
         
        }
            
          },
          builder: (context, state) {
            return IgnorePointer(ignoring: state is Loading,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.r),
                children: [
                  Text('Forget Password',
                      style: TextStyle(
                          color: color2,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10.r),
                  Text('Please enter your email to reset the password',
                      style: TextStyle(
                          color: color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 20.r),
                  Text('Your Email',
                      style: TextStyle(
                          color: color2,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600)),
                  ForgetTextField(error: emailerror,
                    onChanged: (value) {
                      BlocProvider.of<ForgetPasswordCubit>(context).onFilled(value);
                      email = value;
                    },
                    limit: 40,
                  ),
                  ForgetButton(
                    isLoading: state is Loading,
                    label: 'Reset Password',
                    onPressed: () async {
                verificationtoken=      await BlocProvider.of<AuthCubit>(context).requestReset(
                        email!,
                      );
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
  extractStrings(Map map) {
  setState(() {
 
 emailerror = map['email']?.join(', ') ;
  
  });

  
}
}//Please enter your email to reset the password
