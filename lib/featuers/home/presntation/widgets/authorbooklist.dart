import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/authorcubit/authorcubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/authorcubit/authorstates.dart';
import 'package:gp/featuers/home/presntation/widgets/authorbook.dart';

class Authorbooklist extends StatefulWidget {
  const Authorbooklist({
    super.key,required this.id
  });
final int id;
  @override
  State<Authorbooklist> createState() => _AuthorbooklistState();
}

class _AuthorbooklistState extends State<Authorbooklist> {
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<Authorcubit>(context).getFavBooks(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<Authorcubit, AuthorStates>(
        builder: (context, state) {
         if (state is AuthorDone) {
          List? books=BlocProvider.of<Authorcubit>(context).books;
            return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books!.length,
            itemBuilder: (context, index) {
              return  Authorbook(book: books[index],);
            },
          );
         }
         if (state is AuthorLoading) {
           return const Center(child:  CircularProgressIndicator(color: color,),);
         }
         else{
          return Center();
         }
        },
      ),
    );
  }
}
