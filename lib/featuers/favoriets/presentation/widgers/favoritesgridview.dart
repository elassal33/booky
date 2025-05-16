import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favecubit.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favestates.dart';
import 'package:gp/featuers/favoriets/presentation/widgers/favitem.dart';
import 'package:gp/featuers/home/presntation/widgets/placeholder.dart';


class FavorietsGridView extends StatefulWidget {
  const FavorietsGridView({Key? key}) : super(key: key);

  @override
  State<FavorietsGridView> createState() => _BooksGridViewState2();
}

class _BooksGridViewState2 extends State<FavorietsGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavCubit>(context).getFavBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: BlocBuilder<FavCubit, Favstates>(
        builder: (context, state) {
          if (state is FavFailed) {
            return Center(child: Text('network problem'),);
          }
          if (state is Nofav) {
            return Center(child: Text('nofavoriets yet'),);
          }
          if (state is FavLoading) {
            return GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 9.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.56,
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return const BookItemPlaceholder();
              },
            );
          }
          if (state is FavDone) {
            var favCubit = BlocProvider.of<FavCubit>(context);
            var favList = favCubit.favbooks;

            return GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 9.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.56,
                crossAxisCount: 3,
              ),
              itemCount: favList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/bookdetails', arguments: {
                      "index":"$index f",
                      "book":favList[index]
                    });
                  },
                  child: Favitem(
                    index: index,
                    book: favList[index],
                
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
