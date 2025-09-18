import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/core/utilits/customtextfield.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/auth/preasntation/widgets/confirmauthbutton.dart';
import 'package:gp/featuers/auth/preasntation/widgets/dividerrow.dart';
import 'package:gp/featuers/auth/preasntation/widgets/opacitytext.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'socialbutton.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({
    super.key,
  });

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
    final _formKey = GlobalKey<FormState>();
    String? firstnameerror;
    String? lastnameerror;
    String? emailerror;
    String? passerror;
    String? phoneeror;
    Map ?errors;
  late String? email;
  late String? phone;
  late String ?password;
  late String ?fristname;
  late String ?lastname;
  String? verificationtoken;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
         if (state is Serverproblem) {
        
          Popups().showFailDialog(context);
        }
        if (state is Done) {
          setState(() {
              firstnameerror=null;
     lastnameerror=null;
     emailerror=null;
     passerror=null;
          });
          if (verificationtoken !=null) {
             Navigator.pushNamed(
                              context,
                              '/otp code',arguments: verificationtoken
                            );
                            print('the token is: $verificationtoken');
          }
                         
        }
           if (state is Verifyed) {
            setState(() {
          emailerror=null;
        passerror=null;
        firstnameerror=null;
        lastnameerror=null;
        phoneeror=null;
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
          
         
         
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(inAsyncCall: state is SocialLoading,
          progressIndicator:const CircularProgressIndicator(color: color,),
            child: IgnorePointer(ignoring: state is Loading,
              child: Form(key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.r,
                  ),
                  children: [
                    SizedBox(
                      height: 190.h,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'sign up',
                          style: TextStyle(
                              color: color,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 20.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        CustomTextField(error: firstnameerror,onChanged: (p0) {
                          fristname=p0;
                        },
                          limit: 10,
                          hint: 'First name',
                          width: 165.w,
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        CustomTextField(error: lastnameerror,onChanged: (p0) {
                          lastname=p0;
                        },limit: 10, hint: 'Last name', width: 165.w),
                        const Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: CustomTextField(error: emailerror,onChanged: (p0) {
                          email=p0;
                        },
                          limit: 30,
                          hint: 'Enter Your Emial',
                          width: 360.w,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: CustomTextField(error: phoneeror,onChanged: (p0) {
                          phone=p0;
                        },
                          limit: 30,
                          hint: 'Enter Your phone number',
                          width: 360.w,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: CustomTextField(error: passerror,onChanged: (p0) {
                          password=p0;
                        },
                          width: 360.w,
                          hint: 'Enter Your Password',
                          limit: 30,
                        )),
                    SizedBox(
                      height: 15.r,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: ConfirmAuthBotton(
                            onpressed: ()async {
                                    if (_formKey.currentState!.validate()) {
                        verificationtoken=await  BlocProvider.of<AuthCubit>(context).register( email!, password!,fristname!,lastname!,phone!);
                
                              }
                            },
                            name: 'Sign up')),
                    SizedBox(
                      height: 15.r,
                    ),
                    const DividerRow(),
                    SizedBox(
                      height: 20.r,
                    ),
                     Align(
                        alignment: Alignment.center,
                        child: CostumSocialButton(onpressed:  () {
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
                        child: CostumSocialButton(onpressed:  () {
                            Popups().showFacebookLoginInfoDialog(context);
                          },
                          name: 'continue with facebook',
                          image: 'assets/images/Facebook.png',
                        )),
                    SizedBox(
                      height: 20.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: color,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        OpacityText(
                          name: 'Login',
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
     firstnameerror = map['first_name']?.join(', ') ;
   lastnameerror = map['last_name']?.join(', ') ;
 emailerror = map['email']?.join(', ') ;
  passerror = map['password']?.join(', ') ;
  phoneeror = map['phone']?.join(', ') ;
  });

  print(firstnameerror);
}
}
/*void assignValues(List<String> textList) {
  for (var text in textList) {
    if (text.contains('First Name')) {
      firstName = text.split(': ').last;
    } else if (text.contains('Last Name')) {
      lastName = text.split(': ').last;
    } else if (text.contains('Email')) {
      email = text.split(': ').last;
    } else if (text.contains('Password')) {
      password = text.split(': ').last;
    }
  }
}*/