import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/gategoriescubit/categoriesstates.dart';

class categoriescubit extends Cubit<categoriesstates> {
  categoriescubit() : super(Intial());
  
  Bookservice _service = Bookservice();
  List categories = []; // Keeping dynamic type as in original

  void getCategories() async {
    // Only emit loading if not already loading
    if (!isClosed && state is! Loadingg) {
      emit(Loadingg());
    }

    try {
      categories = await _service.getCategories();
      
      if (categories.isEmpty) {
        if (!isClosed) emit(Failed());
      } else {
        if (!isClosed) emit(Donee());
      }
      
      print('Loaded categories: $categories');
    } on DioException catch (e) {
      print('Dio error in cubit: $e');
      if (!isClosed) emit(Failed());
    } catch (e) {
      print('Unexpected error in cubit: $e');
      if (!isClosed) emit(Failed());
    }
  }
}