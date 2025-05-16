// fav_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favecubit.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';


class  FavIcon2 extends StatefulWidget {
  const FavIcon2({super.key,required this.size,required this.id,required this.isloved,required this.index});
final double size;
final bool isloved;
final String id;
final int index;

  @override
  State<FavIcon2> createState() => _FavIcon2State();
}

class _FavIcon2State extends State<FavIcon2> {
  final Bookservice service=Bookservice();
late bool isFavorited;
  @override
  void initState() {
    isFavorited=widget.isloved;
    // TODO: implement initState
    super.initState();
     
  }
  @override
  Widget build(BuildContext context) {
    
    return  Align(alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
                onTap: ()async {
                        setState(() {
            isFavorited = !isFavorited;
                  });
               await   service.toggle(id:int.parse(widget.id) );
            
                    context.read<FavCubit>().deleteItem(widget.index); 
                },
                child: AnimatedSwitcher(
                  duration:const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            key: ValueKey<bool>(isFavorited),
            color: isFavorited ? Colors.red : Colors.black,
            size:widget.size ,
                  ),
                ),
              ),
          ),
         );
  }
}