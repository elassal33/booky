import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/gategoriescubit/categoriescubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/gategoriescubit/categoriesstates.dart';
import 'package:gp/featuers/home/presntation/widgets/booksgridview.dart';
import 'package:gp/featuers/home/presntation/widgets/tababrplaceholder.dart';


class Categorys extends StatefulWidget {
  const Categorys({super.key});

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  List<Widget> tabs = [];
  List<Widget> lists = [];
  List id = [];
  List categories = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<Categoriescubit>(context).getCategories();
  }

  void _buildTabsAndLists() {
    tabs = [];
    lists = [];
    id = [];

    // Add "All" tab first
    tabs.insert(0, const Tab(text: 'all'));
    lists.insert(0, BooksGridView(id: 0));
    id.insert(0, 0);

    // Add category tabs
    for (var category in categories) {
      tabs.add(Tab(text: category.name));
      lists.add(BooksGridView(id: category.id));
      id.add(category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Categoriescubit, categoriesstates>(
      listener: (context, state) {
          if (state is Failed) {
         
          Popups().showFailDialog(context);
          }
      },
      builder: (context, state) {
        if (state is Failed) {
        
          return const Center(child: Text('network problem',style: TextStyle(color: Colors.grey),));
        }
        if (state is Donee) {
          categories = BlocProvider.of<Categoriescubit>(context).categories;
          _buildTabsAndLists();
          
          return DefaultTabController(
            length: tabs.length, // This matches both tabs and lists count
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelStyle: TextStyle(
                    fontSize: 13, 
                    fontWeight: FontWeight.w700
                  ),
                  labelColor: color,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.transparent,
                  tabs: tabs,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TabBarView(
                      clipBehavior: Clip.hardEdge,
                      children: lists,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        // Loading state
        return const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              TabBarPlaceholder(tabCount: 4, isScrollable: false),
              Expanded(child: SizedBox()),
            ],
          ),
        );
      },
    );
  }
}