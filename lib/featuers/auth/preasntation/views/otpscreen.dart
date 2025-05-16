import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordcubit.dart';
import 'package:gp/featuers/auth/preasntation/widgets/otpscreenbody.dart';



class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String verificationtoken=ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(providers: [
         BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ForgetPasswordCubit()),
    ],child:  OtpScreenBody(verificationtoken: verificationtoken,));
  }
}

