import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favecubit.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';

class FavIcon2 extends StatelessWidget {
  const FavIcon2({
    super.key,
    required this.size,
    required this.id,
    required this.isloved,
    required this.index,
  });

  final double size;
  final bool isloved;
  final String id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: GestureDetector(
          onTap: () async {
            await Bookservice().toggle(id: int.parse(id));
            context.read<FavCubit>().deleteItem(index);
            ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    backgroundColor: color,
    content: Text(
      isloved
          ?'The book is removed from favorites!' 
          : 'The book is added to favorites!',
      style: const TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating, // Needed for border radius to be visible
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.all(8), // Optional: gives some space around
  ),
);
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isloved ? Icons.favorite : Icons.favorite_border,
              key: ValueKey<bool>(isloved),
              color: isloved ? Colors.red : Colors.black,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}

/* */