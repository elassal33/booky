// fav_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favecubit.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';


class  FavIcon extends StatefulWidget {
  const FavIcon({super.key,required this.size,required this.id,required this.isloved});
final double size;
final bool isloved;
final String id;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
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
                onTap: ontap,
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

  void ontap()async {
               setState(() {
          isFavorited = !isFavorited;
                });
              await  service.toggle(id:int.parse(widget.id) );

                
            await    BlocProvider.of<FavCubit>(context).getFavBooks();
              }
}