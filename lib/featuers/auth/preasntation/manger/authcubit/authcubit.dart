import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/auth/data/repo/authservice.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class AuthCubit extends  Cubit<AuthStates> {
  AuthCubit() : super(Intial());

  AuthService repo =AuthService();
  Map? error;
  String? message;
  String? verificationtoken2;
  dynamic response;
  Map? data;
Future<String?>  register(String email ,String password ,String fristname,String lastname,String phone)async{
    emit(Loading());

 
try {
   response= await repo.register(email:email, password:password,fristname: fristname,lastname: lastname,phone:phone);
    
  

     if ((response as Map).containsKey('errors') ) {
    
    error=(response['errors']);
    
    emit(Fiald());
    response=null;
    return response;
  }
  
  

 
// ignore: empty_catches, unused_catch_clause
}on DioException catch(e){
emit(Serverproblem());
} 
catch (e) {
  
}
if(response!=null){
emit(Done());

}
else{
  emit(Fiald());
}
return response;
  }
Future<String?>  login(String email ,String password ,)async{
    emit(Loading());
  
try {
  response= await repo.login( email:email, password:password,);
 if ((response as Map).containsKey('errors') ) {
    
    if (response['errors'] != null && response['errors']!.isEmpty) {
      message=response['message'];
      error=null;
    }
    else{
      message=null;
      error=(response['errors']);
    }
    
    emit(Fiald());
    response=null;
    return response;
  }

  if ((response['data'] as Map).containsKey("access_token")) {
    data=response;
    if (data!['data']["access_token"]!=null) {
      emit(Verifyed());
      return data!['data']["access_token"];
    }
    
  }
// ignore: empty_catches, unused_catch_clause
}on DioException catch(e){
emit(Serverproblem());
}  catch (e) {
  emit(Serverproblem());
}
if(response!=null){
emit(Done());
}
else{
  emit(Fiald());
}
return response;
  }
Future  requestReset(String email ,)async{
    emit(Loading());
  
try {
  response= await repo.requestreset( email:email, );
  if ((response as Map).containsKey('errors') ) {
    
    error=(response['errors']);
    
    emit(Fiald());
    response=null;
    return response;
  }
  
// ignore: unused_catch_clause
}on DioException catch(e){
emit(Serverproblem());
}  catch (e) {
  
}
if(response!=null){
emit(Done());
}
else{
  emit(Fiald());
}
return response;
  }
Future  resetPassword(String password,String passtoken,)async{
    emit(Loading());
 
  try {
     response= await repo.resetPassword(password: password,passtoken: passtoken  );
 if ((response as Map).containsKey('errors') ) {
    
    if (response['errors'] != null && response['errors']!.isEmpty) {
      message=response['message'];
      error=null;
    }
    else{
      message=null;
      error=(response['errors']);
    }
    
    emit(Fiald());
    response=null;
    return response;
  }
  // ignore: unused_catch_clause
  }on DioException catch(e){
emit(Serverproblem());
}  catch (e) {
    
  }

if(response!=null){
emit(Done());
}
else{
  emit(Fiald());
}
return response;
  }


Future<String?>  resend(String verificationtoken)async{
   try {
      verificationtoken2= await repo.resendToken(verificationtoken);
      
   // ignore: unused_catch_clause
   }on DioException catch(e){
emit(Serverproblem());
} catch (e) {
     
   } 
 
return verificationtoken2;


  }
Future  resolvePasswordOrAccessToken(String verificationtoken,int code )async{
    emit(Loading());
  response= await repo.resolvePasswordOrAccessToken(verificationtoken,code );

try {
  if ((response as Map).containsKey('errors') ) {
    
    message=(response['message']);
    
    emit(Fiald());
    response=null;
    return response;
  }


  if ((response['data'] as Map).containsKey("password_token")) {
    data=response;
    if (data!['data']["password_token"]!=null) {
      emit(Reset());
      return data!['data']["password_token"];
    }
    
  }
// ignore: empty_catches, unused_catch_clause
}on DioException catch(e){
emit(Serverproblem());
}  catch (e) {

}

  

  
  
  

if(response!=null){
emit(Done());
}
else{
  emit(Fiald());
}
return response;
  }

 socialAuth()async{
  try {
    emit(SocialLoading());
   data=   await repo.socialAuth();
   print("dataaaaaaaaaa$data");
      if (data!=null) {
        emit(Verifyed());
        
      }
      else{
        emit(Fiald());
      }
    
  // ignore: unused_catch_clause
  }on DioException catch(e){
emit(Serverproblem());
}  catch (e) {
    
  }
  
}
 signInWithFacebook()async{
  
   data=   await repo.socialAuthFacebook();
      if (data!=null) {
        emit(Verifyed());
        
      }
      else{
        emit(Fiald());
      }
}
Future signInWithhFacebook() async {
try {
    // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email']);

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

 final userData = await FacebookAuth.instance.getUserData(
        fields: "name,email",
      );

      // Extract name and email
      final String? name = userData["name"];
      final String? email = userData["email"];

      print('Name: $name');
      print('Email: $email');
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

// ignore: unused_catch_clause
} on DioException catch(e){
emit(Serverproblem());
}
 catch (e) {
  
}
}

logout()async{
  emit(Loading());
response=await repo.logout();
if (response=="done") {
  emit(Logout());
}
}

}
  

/*Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

 final userData = await FacebookAuth.instance.getUserData(
        fields: "name,email",
      );

      // Extract name and email
      final String? name = userData["name"];
      final String? email = userData["email"];

      print('Name: $name');
      print('Email: $email');
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
*/