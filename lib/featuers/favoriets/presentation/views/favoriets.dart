import 'package:flutter/material.dart';
import 'package:gp/featuers/favoriets/presentation/widgers/favoritesgridview.dart';

class Favoriets extends StatelessWidget {
  const Favoriets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Favoriets',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: const FavorietsGridView(),
      ),
    );
  }
}
