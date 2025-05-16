

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/mybooks/data/service.dart';


import 'package:gp/featuers/mybooks/presentation/manger/purchasedbookscubit/purchasedbooksstates.dart';


class Purchasedbookscubit extends Cubit<Purchasedstates> {
  Purchasedbookscubit() : super(PurchasedIntial());

  List purchasedbooks = [];

  Future<List?> getPurchasedbooks() async {
    try {
      if (!isClosed) emit(PurchasedLoading());

    PurchasedService _service = PurchasedService();
    purchasedbooks = await _service.fetchBooks();
    print('Fetched : $purchasedbooks');
if (purchasedbooks.isNotEmpty) {
  if (!isClosed) emit(PurchasedDone());
}
else{
  emit(NoPurchased() );
}
    

    return purchasedbooks;
    // ignore: unused_catch_clause
    }on DioException catch(e){
emit(PurchasedFailed() );

    } 
    catch (e) {
      emit(PurchasedFailed() );
    }
    return [];
  }

  void deleteItem(int index) {
    if (index >= 0 && index < purchasedbooks.length) {
      purchasedbooks.removeAt(index);

      if (!isClosed) {
        emit(PurchasedDone()); // Emit after removing
      }
    }
  }
}
