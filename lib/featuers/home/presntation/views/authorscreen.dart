import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/authorcubit/authorcubit.dart';
import 'package:gp/featuers/home/presntation/widgets/authorbooklist.dart';
import 'package:gp/featuers/home/presntation/widgets/authorinfo.dart';

class Authorscreen extends StatelessWidget {
  const Authorscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Author author = ModalRoute.of(context)!.settings.arguments as Author;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthorInfo(
            author: author,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'books',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => Authorcubit(),
            child: Authorbooklist(
              id: author.id,
            ),
          )
        ],
      ),
    );
  }
}
