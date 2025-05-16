import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/profile/data/service.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilesates.dart';

class EditeprofileCubit extends Cubit<EditeProfileStates> {
  EditeprofileCubit() : super(EditIntial());
  var response;
  Map? errors;
  String? message;
  EditeServices repo=EditeServices();
  Future<String> updateProfile({String? phone ,required String fristname,required String lastname,String? birthdate,File? image})async{
    emit(EditLoading());
  response= await repo.updateProfile( phone: phone, fristname: fristname, lastname: lastname, birthdate: birthdate, image: image);
try {
  
    
  

     if ((response as Map).containsKey('errors') ) {
    print(errors);
    errors=(response['errors']);
    
    emit(EditFiald());
    response=null;
    
  }
  
  

 
// ignore: empty_catches
} catch (e) {
  
}
if (response != null) {
  emit(EditDone());
  // Access the data correctly - response is now the direct Map
  if (response['data'] != null && response['data']['image'] != null) {
    
    return response['data']['image'].toString();
  }
}
else{
  emit(EditFiald());
}
return '';

  }
  Future contactus({required String email ,required String message,required String name,})async{
    print('kk');
    emit(EditLoading());
  response= await repo.contactus(email: email, name: name, message: message);
try {
  
    
  

     if ((response as Map).containsKey('errors') ) {
    
    errors=(response['errors']);
    
    emit(EditFiald());
    response=null;
    return response;
  }
  
  

 
// ignore: empty_catches
} catch (e) {
  
}
if(response!=null){

emit(EditDone());

}
else{
  emit(EditFiald());
}
return response;
  }
}