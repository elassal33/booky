import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/authorcubit/authorstates.dart';


class Authorcubit extends Cubit<AuthorStates> {
  Authorcubit() : super(AuthorIntial());

  List? books = [];

  Future<List?> getFavBooks({required int id}) async {
    if (!isClosed) emit(AuthorLoading());

  try {
      Bookservice _service = Bookservice();
    books = await _service.fetchAuthorBooks(id:id);
    print('Fetched categories: $books');

    if (!isClosed) emit(AuthorDone());
  // ignore: unused_catch_clause
  }on DioException catch(e){
    emit(AuthorFailed());
  }
   catch (e) {
    
  }

    return books;
  }

  
}
