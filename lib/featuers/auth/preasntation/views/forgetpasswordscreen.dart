import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordcubit.dart';
import 'package:gp/featuers/auth/preasntation/widgets/forgetpassbody.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
           BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ForgetPasswordCubit()),
    ],child: const ForgetPassBody());
  }
}

