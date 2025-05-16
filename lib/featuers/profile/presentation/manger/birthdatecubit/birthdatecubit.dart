import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/profile/presentation/manger/birthdatecubit/birthdatestates.dart';

class BirthDateCubit extends Cubit<BirthDateStates> {
  BirthDateCubit() : super(ManuallyFilled());
  String? dateTime;
  void pickvarinit(String date){
dateTime=date;
emit(AutoFilled());
  }
  void pickvarbycalender(String date){
dateTime=date;
emit(AutoFilled());
  }
  void pickvarbyuser(String date){
dateTime=date;
emit(AutoFilled());
  }
}