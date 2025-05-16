import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/search/presentation/manger/searchcubit.dart';
import 'package:gp/featuers/search/presentation/views/searchbody.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: SearchBody(),
    );
  }
}
