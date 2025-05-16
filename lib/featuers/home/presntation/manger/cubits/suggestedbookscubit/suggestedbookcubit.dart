import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbooksstates.dart';

class Suggestedbookscubit extends Cubit<Suggestedbooksstates> {
  Suggestedbookscubit() : super(Intialstate() );
  
   List<BookModel> suggestedBooks = [];
   BookModel? book;
  void fetchsuggestedBooks({required int id})async {
    emit(Loading());
  Bookservice service=Bookservice();
final response =await service.fetchsuggestedBooks(id: id);
book=response.book;
 suggestedBooks=response.suggestedBooks;

emit(Done());

}
}