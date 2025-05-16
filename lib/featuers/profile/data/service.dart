import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EditeServices {



  Future updateProfile({
  required String? phone,
  required String fristname,
  required String lastname,
  required String? birthdate,
  required File? image,
}) async {
  final dio = Dio();
 final prefs = await SharedPreferences.getInstance();
          final userPrefs = UserPrefs(prefs);
          final  token = userPrefs.getUser()['token'];
  try {
    final formData = FormData.fromMap({
      "first_name": fristname,
      "last_name": lastname,
      if (phone != null) "phone": phone,
      if (birthdate != null) "birth_date": birthdate,
      if (image != null)
        "image": await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
    });

    final response = await dio.post(
      '$baseurl/api/v1/update-profile',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 500,
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        },
      ),
    );

    print(response);
   
   if (response.statusCode == 200) {
     

        userPrefs.saveUser(
          token:token! ,
  firstName: response.data['data']['first_name'] ?? '',
  lastName: response.data['data']['last_name'] ?? '',
  email: response.data['data']['email'],
  phone: response.data['data']['phone'] ?? '',
  birthdate: response.data['data']['birth_date'] ?? '',
  image:  response.data['data']['image'],
);
  return response.data; // Return the parsed data directly
  // Now response.data is the actual Map containing 'data' and 'image'
} else if (response.statusCode == 422) {
      Map errors = response.data;
      print(errors);
      return errors;
    } else {
      print('Failed to update profile. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}
Future contactus({required String  email,required String name,required String message}) async {
  final dio = Dio();
   final prefs = await SharedPreferences.getInstance();
          final userPrefs = UserPrefs(prefs);
          final  token = userPrefs.getUser()['token'];
  try {
    final response = await dio.post(
      '$baseurl/api/v1/contact-us', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  'Authorization': 'Bearer $token',
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }   ),
      data:{
        "name":name,
        
         "email": email,
        "message": message,
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.data;
    }
    if (response.statusCode==422) {
      print(response.statusMessage);
      Map errors =response.data;
      return  errors;
    }
     else {
      print(response.statusCode);
    }
  } catch (e) {
    print(e);
    return null;
  }
}  
}