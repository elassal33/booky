import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordcubit.dart';
import 'package:gp/featuers/auth/preasntation/widgets/custompinfield.dart';
import 'package:gp/featuers/auth/preasntation/widgets/forgetbutton.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({
    required this.verificationtoken,
    super.key,
  });
  final String verificationtoken;

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  String? error;
  bool clicked=false;
  String? verificationtoken2;
   String? accesstoken;
  final _formKey = GlobalKey<FormState>();
   int? code;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
listener: (context, state) {
   if (state is Done) {
               Navigator.of(context).pushNamedAndRemoveUntil( '/main', 
              (Route<dynamic> route) => false, 
);
                          print('this is acesstoken$accesstoken');
                        }
   if (state is Reset) {
Navigator.pushNamed(context, '/Change Password',arguments: accesstoken);
                          print('this is passtoken$accesstoken');
                        }
                        if (state is Fiald) {
                          error='invalid otp code';
                         // error=BlocProvider.of<AuthCubit>(context).message;
                          print(error);
                        }
},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: IgnorePointer(
              ignoring: state is Loading,
              child: Form(key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  children: [
                    Text('Check Your Email',
                        style: TextStyle(
                            color: color2,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 10.r),
                    Row(
                      children: [
                        Text('We sent a reset link to ',
                            style: TextStyle(
                                color: color,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600)),
                        Text('contact@dscode...com',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Text('enter 5 digit code that mentioned in the email',
                        style: TextStyle(
                            color: color,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 20.r),
                    Row(
                      children: [
                        SizedBox(
                          width: 24.r,
                        ),
                      ],
                    ),
                     CustomPinField(error: error,onChanged: (input) {
                     
                    BlocProvider.of<ForgetPasswordCubit>(context).oncomplete(input);
                    if (input.isNotEmpty) {
                      code=int.parse(input);
                    }
                    
                   
                    },),
                    SizedBox(height: 20.h),
                    ForgetButton(isLoading: state is Loading,
                      label: 'Verify Code',
                      onPressed: ()async {
                        if (_formKey.currentState!.validate()){
                   accesstoken=       await BlocProvider.of<AuthCubit>(context)
                            .resolvePasswordOrAccessToken(verificationtoken2==null? widget.verificationtoken:verificationtoken2!, code!);
                           
                        }
                       
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Haven’t got the email yet?',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600)),
                        GestureDetector(
                          onTap: ()async {
                        verificationtoken2=await    BlocProvider.of<AuthCubit>(context).resend(clicked? verificationtoken2!:widget.verificationtoken);
                        clicked=true;
                        print('secondtoken: $verificationtoken2');
                          },
                          child: Text('Resend Email',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: color,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

//contact@dscode...com
