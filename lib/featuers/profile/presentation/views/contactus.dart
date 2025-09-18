import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/featuers/profile/presentation/widgers/contactusbody.dart';


class Contactus extends StatefulWidget {
  const Contactus({
    super.key,
  });

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         
          
        ),
        body: BlocProvider(
          create: (context) => EditeprofileCubit(),
          child:const Contactusbody(),
        ));
  }
}

