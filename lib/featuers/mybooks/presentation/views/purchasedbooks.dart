
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/mybooks/presentation/manger/purchasedbookscubit/purchasedbookscubit.dart';
import 'package:gp/featuers/mybooks/presentation/manger/purchasedbookscubit/purchasedbooksstates.dart';
import 'package:gp/featuers/mybooks/presentation/widgers/parchasedplaceholder.dart';
import 'package:gp/featuers/mybooks/presentation/widgers/purchaseditem.dart';



class PurchasedBooks extends StatefulWidget{
  const PurchasedBooks({super.key});

  @override
  State<PurchasedBooks> createState() => _PurchasedBooksState();
}

class _PurchasedBooksState extends State<PurchasedBooks> {
  @override
  void initState() {
  
    super.initState();
    BlocProvider.of<Purchasedbookscubit>(context).getPurchasedbooks();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
      
   appBar:  AppBar(title:const Text('My Books',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600 ),),)
    ,body:  BlocBuilder<Purchasedbookscubit, Purchasedstates>(
      builder: (context, state) {
       if (state is PurchasedDone) {
        List books=[];
      books=  BlocProvider.of<Purchasedbookscubit>(context).purchasedbooks;
          return ListView.builder(padding:const EdgeInsets.all(0),
          itemCount: books.length,
          itemBuilder: (context,count)=> GestureDetector(onTap: () {
             Navigator.pushNamed(context, '/bookdetails', arguments: {
                     "index":"$count p",
                     "book":books[count]
                   });
          },
           child: PurchasedItem(book: books[count],)));
       }
       if (state is PurchasedLoading) {
         return ListView.builder(padding:const EdgeInsets.all(0),
         itemCount: 10,
         itemBuilder: (context,count)=> const PurchasedItemShimmer());
       }
       else{
        return const  Center(child: Text(' no purchased books yet',style: TextStyle(color: Colors.grey),),);
       }
      },
    )
    ,);
    
  }
}