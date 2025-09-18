import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/gategoriescubit/categoriescubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/homecubit.dart';

import 'package:gp/featuers/home/presntation/widgets/authorslist.dart';
import 'package:gp/featuers/home/presntation/widgets/categories.dart';
import 'package:gp/featuers/home/presntation/widgets/explore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Categoriescubit>(
          create: (context) => Categoriescubit(),
        ),
      ],
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60.h,
            ),
          ),
      const    Explore(),
    const      SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              'Authors',
              style: TextStyle(
                  color: color, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 70,
              child: BlocProvider(
                create: (context) => HomeCubit(),
                child:const Authorslist(),
              ),
            ),
          ),
     const     SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text(
              'categories',
              style: TextStyle(
                  color: color, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          )),
   const       SliverFillRemaining(
              child: const Categorys())
        ],
      ),
    );
  }
}
