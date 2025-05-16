import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbookcubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbooksstates.dart';
import 'package:gp/featuers/home/presntation/widgets/bookdetailsplaceholder.dart';
import 'package:gp/featuers/home/presntation/widgets/bookdetailsready.dart';


class BookDetailsbody extends StatefulWidget {
  const BookDetailsbody({super.key,required this.book,required this.index});
  final String index;

  final BookModel book;

  @override
  State<BookDetailsbody> createState() => _BookDetailsbodyState();
}

class _BookDetailsbodyState extends State<BookDetailsbody> {
 

  @override
  void initState() {
    super.initState();
    BlocProvider.of<Suggestedbookscubit>(context).fetchsuggestedBooks(id:widget. book.id );
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Suggestedbookscubit, Suggestedbooksstates>(
      builder: (context, state) {
        if (state is Done) {
       BookModel ?_book =  BlocProvider.of<Suggestedbookscubit>(context).book;
          return Bookdetailsready(book:_book!, index:widget.index );
        }else{
          return const BookDetailsShimmer();
        }
        
      },
    );
  }
}

