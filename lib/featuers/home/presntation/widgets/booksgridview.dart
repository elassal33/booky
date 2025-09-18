import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/homecubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/homestates.dart';
import 'package:gp/featuers/home/presntation/widgets/bookitem.dart';
import 'package:gp/featuers/home/presntation/widgets/placeholder.dart';

class BooksGridView extends StatefulWidget {
  const BooksGridView({
    this.place,
    super.key,
    required this.id,
  });

  final String? place;
  final int id;

  @override
  State<BooksGridView> createState() => _BooksGridViewState();
}
  
class _BooksGridViewState extends State<BooksGridView> {
  

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initial Load when widget is created
    context.read<HomeCubit>().loadBooks(isInitialLoad: true, id: widget.id);

    // Listen for scroll to bottom and trigger load more books when nearing the end
    _scrollController.addListener(() {
      final cubit = context.read<HomeCubit>();
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 300 &&
          cubit.state is! LoadingMore) {
        // Trigger to load more books
        cubit.loadBooks(id: widget.id);
      }
    });
  }
 void didPopNext() {
    // Trigger reload when coming back from BookDetails
    context.read<HomeCubit>().loadBooks(isInitialLoad: true, id: widget.id);
    
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: BlocBuilder<HomeCubit, Homestates>(
        builder: (context, state) {
          final books = context.read<HomeCubit>().books;
 if (state is BooksFailed) {
  print('fffffffffffffffffff');
 Popups().showFailDialog(context);
          return Center(child: Text('network problem'),);
        }
          if (state is BooksLoading ) {
            // Show loading spinner while books are being loaded
            return GridView.builder(
              
              controller: _scrollController,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 9,
                mainAxisSpacing: 4,
                childAspectRatio: 0.56,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                
                  // If all books are loaded but still loading more, show loading spinner
                  return const BookItemPlaceholder();
                
              },
              itemCount: 9, // Add 1 to account for the loading item
            );
          } else if (state is BooksFailed) {
            // Show an error message if fetching books fails
            return Center(child: Text("Failed to load books"));
          } else {
            // Once books are done loading, display them in grid
            return GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 9,
                mainAxisSpacing: 2,
                childAspectRatio: 0.56,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                if (index < books.length) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/bookdetails', arguments: {
                        'index': '$index',
                        'book': book
                      });
                    },
                    child: BookItem(
                      book: book,
                      index: "$index"
                    ),
                  );
                } else {
                  return const Center(
                   
                  );
                }
              },
              itemCount: books.length + 1, // Add 1 to account for the loading item
            );
          }
        },
      ),
    );
  }
}
