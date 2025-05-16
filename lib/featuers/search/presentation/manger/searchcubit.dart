import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/search/data/service.dart';
import 'package:gp/featuers/search/presentation/manger/searchstates.dart';


class SearchCubit extends Cubit<Searchsatates> {
  SearchCubit() : super(Initial());

  List books = [];

  Future<List?> getBooks({String? name}) async {
    if (!isClosed) emit(Loading());
try {
   SearchService service = SearchService();
    books = await service.fetchBooks(name: name);


    if (!isClosed) emit(Found());

    return books;
}on DioException catch (e) {
      print('Dio error in cubit: $e');
      if (!isClosed) emit(Fail());
    } catch (e) { 
emit(Fail());
   
  }
return [];
  
  }
}
