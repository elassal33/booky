import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/authorcubit/authorstates.dart';


class Authorcubit extends Cubit<AuthorStates> {
  Authorcubit() : super(AuthorIntial());

  List? books = [];

  Future<List?> getFavBooks({required int id}) async {
    if (!isClosed) emit(AuthorLoading());

    Bookservice _service = Bookservice();
    books = await _service.fetchAuthorBooks(id:id);
    print('Fetched categories: $books');

    if (!isClosed) emit(AuthorDone());

    return books;
  }

  
}
