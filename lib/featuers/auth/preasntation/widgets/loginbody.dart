import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/core/utilits/customtextfield.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/auth/preasntation/widgets/confirmauthbutton.dart';
import 'package:gp/featuers/auth/preasntation/widgets/dividerrow.dart';
import 'package:gp/featuers/auth/preasntation/widgets/opacitytext.dart';
import 'package:gp/featuers/auth/preasntation/widgets/socialbutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
      String? emailerror;
    String? passerror;
    String? finalerror;
    Map? errors;
  late String? email;
  late String? password;
  String? verificationtoken;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is Done) {
        setState(() {
          emailerror=null;
        passerror=null;
        });
               Navigator.pushNamed(
                              context,
                              '/otp code',arguments: verificationtoken
                            );
                            print(verificationtoken);
        }
        if (state is Serverproblem) {
          print('bjoemo');
          Popups().showFailDialog(context);
        }
        if (state is Verifyed) {
            setState(() {
          emailerror=null;
        passerror=null;
        });
               Navigator.of(context).pushNamedAndRemoveUntil( '/main', 
              (Route<dynamic> route) => false, 
);
                            
        }
         if (state is Fiald) {
          errors=BlocProvider.of<AuthCubit>(context).error;
          if (errors!=null) {
            extractStrings(errors!);
          }
          else{
 emailerror=BlocProvider.of<AuthCubit>(context).message;
 passerror=emailerror;
          }
         
          
          
         
         
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(inAsyncCall: state is SocialLoading,
          progressIndicator:const CircularProgressIndicator(color: color,),
            child: IgnorePointer(
              ignoring: state is Loading,
              child: Form(key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  children: [
                    SizedBox(height: 190.h),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: color,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 40.r,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: CustomTextField(
                          onChanged: (e) {
                            email = e;
                          },error: emailerror,
                          hint: 'Enter Your Emial',
                          width: 360.w,
                          limit: 30,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: CustomTextField(
                          onChanged: (p) {
                            password = p;
                          },error: passerror,
                          width: 360.w,
                          hint: 'Enter Your Password',
                          limit: 30,
                        )),
                    SizedBox(
                      height: 20.r,
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: OpacityText(
                          name: 'Forget Password?',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      height: 15.r,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: ConfirmAuthBotton(
                          onpressed: () async{
                            if (_formKey.currentState!.validate()) {
                      verificationtoken=await BlocProvider.of<AuthCubit>(context).login( email!, password!);
                         ;
                            }
                          },
                          name: 'login',
                        )),
                    SizedBox(
                      height: 15.r,
                    ),
                    const DividerRow(),
                    SizedBox(
                      height: 20.r,
                    ),
                     Align(
                        alignment: Alignment.center,
                        child: CostumSocialButton(onpressed: () {
                          BlocProvider.of<AuthCubit>(context).socialAuth();
                        },
                          name: 'continue with google',
                          image: 'assets/images/Google.png',
                        )),
                    SizedBox(
                      height: 10.r,
                    ),
                     Align(
                        alignment: Alignment.center,
                        child: CostumSocialButton(onpressed: () {
                          Popups().showFacebookLoginInfoDialog(context);
                        // BlocProvider.of<AuthCubit>(context).signInWithFacebook();
                        },
                          name: 'continue with facebook',
                          image: 'assets/images/Facebook.png',
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                              color: color,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        OpacityText(
                          name: 'Sign up',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  extractStrings(Map map) {
  setState(() {

 emailerror = map['email']?.join(', ') ;
  passerror = map['password']?.join(', ') ;
  });

  
}
}
