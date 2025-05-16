

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/favoriets/data/service.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favestates.dart';


class FavCubit extends Cubit<Favstates> {
  FavCubit() : super(FavIntial());

  List favbooks = [];

  Future<List?> getFavBooks() async {
    try {
      if (!isClosed) emit(FavLoading());

    FavService _service = FavService();
    favbooks = await _service.fetchBooks();
    print('Fetched categories: $favbooks');
if (favbooks.isNotEmpty) {
  if (!isClosed) emit(FavDone());
}
else{
  emit(Nofav() );
}
    

    return favbooks;
    // ignore: unused_catch_clause
    }on DioException catch(e){
emit(FavFailed() );

    } 
    catch (e) {
      emit(FavFailed() );
    }
    return [];
  }

  void deleteItem(int index) {
    if (index >= 0 && index < favbooks.length) {
      favbooks.removeAt(index);

      if (!isClosed) {
        emit(FavDone()); // Emit after removing
      }
    }
  }
}
