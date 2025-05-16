import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/featuers/search/presentation/manger/searchcubit.dart';
import 'package:gp/featuers/search/presentation/manger/searchstates.dart';
import 'package:gp/featuers/search/presentation/widgers/searchitem.dart';
import 'package:gp/featuers/search/presentation/widgers/searchrextfield.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List? books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Center(
            child: SearchTextField(
              limit: 20,
              width: 400.w,
              hint: 'search',
              onChanged: (input) async {
                books = await BlocProvider.of<SearchCubit>(context)
                    .getBooks(name: input);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: Center(
              child: BlocBuilder<SearchCubit, Searchsatates>(
                builder: (context, state) {
                  if (state is Found) {
                    return ListView.builder(
                      itemCount: books!.length,
                      itemBuilder: (context, count) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context, 
                            '/bookdetails', 
                            arguments: {
                              "index": count.toString(),
                              "book": books![count]
                            },
                          );
                        },
                        child: Searchitem(book: books![count]),
                      ),
                    );
                  }
                  if (state is Fail) {
                     return const Text('not found');
                  }
                  if (state is Initial) {
                    return const Text(
                      'start search',
                      style: TextStyle(fontSize: 18),
                    );
                  }
                  if (state is Loading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text('not found');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}