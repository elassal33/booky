import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordstates.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(NotFilled());
  String? password;
  String? confirmpassword;
  void onFilled(String? content){
    if (content!.endsWith('@gmail.com')&&content.length>10) {
      emit(Filled());
    }
    else{
      emit(NotFilled());
    }
  
  }
  void onequal(String? content){
    if (password!.isNotEmpty &&  password==confirmpassword) {
      emit(Filled());
    }
    else{
      emit(NotFilled());
    }
  
  }
  void oncomplete(String? content){
    if (content!.length==4) {
      emit(Filled());
    }
    else{
      emit(NotFilled());
    }
  
  }
}