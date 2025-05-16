import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthService {

  
Future register({required String  email,required String password,required String fristname,required String lastname,required String phone}) async {
  final dio = Dio();
  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/register', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }   ),
      data:{
        "first_name":fristname,
        "last_name":lastname,
         "email": email,
        "password": password,
        "phone": phone,
      },
    );
    if (response.statusCode == 200) {
      return response.data['data']['verification_token'];
    }
    if (response.statusCode==422) {
      Map errors =response.data;
      return  errors;
    }
     else {
      return null;
    }
  } catch (e) {
    return null;
  }
}  



Future login({required String  email,required String password,}) async {
  final dio = Dio();

  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/login', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
      data: {
        "email": email,
        "password": password,
      }

    );
     final prefs = await SharedPreferences.getInstance();
     if (response.statusCode==422||response.statusCode==400) {
      Map errors =response.data;
      return  errors;
    }

    if (response.statusCode == 200) {
      if ((response.data['data'] as Map).containsKey('access_token')) {
        print(response.data);
        final Map resourses=response.data;
         final userData = response.data['data'];
  final user = UserPrefs(prefs);
    await    user.saveUser(firstName: userData['first_name'],
         lastName: userData['last_name'], 
         email: userData['email'],
         phone: userData['phone'],
         image: userData['image'],
         birthdate: userData['birth_date'],
          token: userData['access_token']);
        return resourses;
        
      }
      return response.data['data']['verification_token'];
    }
   
    else {
      print('Failed to get token. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}  
Future requestreset({required String  email}) async {
  final dio = Dio();

  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/request-reset-password', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
      data:{
        
        
         "email": email,
       

      },

    );
if (response.statusCode==422) {
  return response.data;
}
    if (response.statusCode == 200) {
      return response.data['data']['verification_token'];
    } else {
      print('Failed to get token. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}  
Future resetPassword({required String  password,required String passtoken}) async {
  final dio = Dio();

  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/reset-password', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
      data:{
        
        "token":passtoken,
         "password": password,
       

      },

    );

    if (response.statusCode == 200||response.statusCode==422||response.statusCode==400) {
      return response.data;
    } else {
      print('Failed to get token. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}  
Future resolvePasswordOrAccessToken(String verificationToken, int code) async {
  final dio = Dio();

  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/verify-otp',
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 500,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
      data: {
        "verification_token": verificationToken,
        "code": code,
      },
    );

    final prefs = await SharedPreferences.getInstance();
    final data = response.data['data'] as Map;

    if (response.statusCode == 422 || response.statusCode == 400) {
      return response.data;
    }

    if (response.statusCode == 200) {
      if (data.containsKey('access_token')) {
        final user = UserPrefs(prefs);
     await   user.saveUser(
          firstName: data['first_name'],
          lastName: data['last_name'],
          email: data['email'],
           phone: data['phone'],
         image: data['image'],
         birthdate: data['birth_date'],
          token: data['access_token'],
        );
        return data['access_token'];
      }

      if (data.containsKey('password_token')) {
        return response.data; // return full data if token needs to be set later
      }
    }

    print('OTP verification failed. Status: ${response.statusCode}');
    print('Response: ${response.data}');
    return null;
  } catch (e) {
    print('OTP verification error: $e');
    return null;
  }
}
  
Future<String?> resendToken(String verificationtoken, ) async {
  final dio = Dio();

  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/resend-otp', 
       options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
      data: {
     "token":verificationtoken,
 
      },

    );

    if (response.statusCode == 200) {
      return response.data['data']['verification_token'];
    } else {
      print('Failed to get token. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
  
}  


Future<Map?> socialAuth() async {
  final dio = Dio();
  User? user=await signInWithGoogle();
  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/social-login', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
      data:{
        
        "email": user!.email,
    "social_type": "google",
    "social_id": user.uid
       

      },

    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('Failed to get token. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}  
Future<Map?> socialAuthFacebook() async {
  final dio = Dio();
  Map? user=await signInWitFacebook();
  try {
    final response = await dio.post(
      '$baseurl/api/v1/auth/social-login', 
      options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
      data:{
        
        "email": user!['email'],
    "social_type": "google",
    "social_id": user['id']
       

      },

    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('Failed to get token. Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}  




GoogleSignIn googleSignIn=GoogleSignIn();
 Future<User?> signInWithGoogle() async {
  
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
    
  );
  UserCredential userCredential =
   await FirebaseAuth.instance.signInWithCredential(credential);
   User? user=userCredential.user;
   await FirebaseAuth.instance.signInWithCredential(credential);

  // Once signed in, return the UserCredential
  return user;
}




Future<Map?> signInWitFacebook() async {
  try {
    // Trigger Facebook login
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
      loginBehavior: LoginBehavior.dialogOnly,
    );

    if (result.status == LoginStatus.success) {
      // Retrieve user data
      final userData = await FacebookAuth.instance.getUserData(
        fields: "name,email,id",
      );
      final String? name = userData["name"];
      final String? email = userData["email"];
      final String? uid = userData["id"];

      
      

      // Extract name and email
      
      print('Name: $name');
      print('Email: $email');
      print('id: $uid');
       return userData;
      
    } else {
      print('Facebook login failed: ${result.message}');
      
    }
   
  } catch (e) {
    print('Error during Facebook login: $e');
  }
  return null;
}
Future logout() async {
  final dio = Dio();
final token = await gettoken();
  try {
    final response = await dio.post('$baseurl/api/v1/auth/logout', options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            
 headers: {
  'Authorization': 'Bearer $token',
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),);
print("wwwwwwwwwwwwwww$response.statusCode");
    if (response.statusCode == 200) {
return'done';
    
  
    } else {
     
    }
  } catch (e) {
    print('Error: $e');
    return '' ;
  }
}
Future<String?>  gettoken()async{
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = UserPrefs(prefs);

    // Get token from SharedPreferences
    final token = userPrefs.getUser()['token'];
    return token;
  }
}




