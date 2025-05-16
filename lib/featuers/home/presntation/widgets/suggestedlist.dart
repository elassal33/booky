import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbookcubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbooksstates.dart';
import 'package:gp/featuers/home/presntation/widgets/susggestedbook.dart';

class Suggestedlist extends StatefulWidget {
  const Suggestedlist({
    super.key,required this.book
  });
final BookModel book;
  @override
  State<Suggestedlist> createState() => _SuggestedlistState();
}

class _SuggestedlistState extends State<Suggestedlist> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Suggestedbookscubit, Suggestedbooksstates>(
      builder: (context, state) {
           
                 if (state is Done) {
          final List sugbooks=      BlocProvider.of<Suggestedbookscubit>(context).suggestedBooks;
                return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sugbooks.length,
            itemBuilder: (context, index) {
           
           return GestureDetector( onTap: () {
                    Navigator.pushReplacementNamed(context, '/bookdetails',
                        arguments:{
                          'index': "index s",
                          'book':sugbooks[index]
                        });
                  },child: SusggestedBook(book: sugbooks[index],index: index.toString(),));
              
            },
          ),
        );
              }
       else{
        return SizedBox();
       }
      },
    );
  }
}
