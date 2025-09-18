import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/presntation/widgets/authoritem.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/homecubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/homestates.dart';
import 'package:gp/featuers/home/presntation/widgets/authoritemplaceholder.dart';

class Authorslist extends StatefulWidget {
  const Authorslist({super.key});

  @override
  State<Authorslist> createState() => _AuthorslistState();
}

class _AuthorslistState extends State<Authorslist> {
  final ScrollController _scrollController = ScrollController();

 void _setupScrollListener(HomeCubit cubit) {
  _scrollController.addListener(() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !cubit.isLoadingMore &&
        cubit.hasMore) {
      cubit.loadauthors();
    }
  });
}


  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeCubit>();
    cubit.loadauthors(isInitialLoad: true);
    _setupScrollListener(cubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, Homestates>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        if (state is BooksFailed) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        }

        if (state is BooksLoading && cubit.authors.isEmpty) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return const Center(child: AuthorItemPlaceholder());
              },
            ),
          );
        }

        return SizedBox(
          height: 150,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: cubit.authors.length,
            itemBuilder: (context, index) {
              final author = cubit.authors[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/author',
                  arguments: author,
                ),
                child: Hero(
                  tag: '${author!.id} ${author.name}',
                  child: Authoritem(author: author),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
