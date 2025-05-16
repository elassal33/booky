import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/profile/presentation/manger/birthdatecubit/birthdatecubit.dart';
import 'package:gp/featuers/profile/presentation/widgers/editprofilebody.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
return MultiBlocProvider(providers: [
  
   BlocProvider<BirthDateCubit>(
      create: (context) => BirthDateCubit(),
    ),
],child: const Editprofilebody());
  }
  
}