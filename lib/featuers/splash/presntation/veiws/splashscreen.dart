import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){

   _checkTokenAfterDelay();
    super.initState();
   
  }



 Future<void> _checkTokenAfterDelay() async {
  await Future.delayed(const Duration(seconds: 2));

  final prefs = await SharedPreferences.getInstance();
  final userPrefs = UserPrefs(prefs);

  final token = userPrefs.getUser()['token'];

  if (!mounted) return; // Always check this before navigation from async code

  if (token != null && token.isNotEmpty) {
    Navigator.pushReplacementNamed(context, '/main');
  } else {
    Navigator.pushReplacementNamed(context, '/onboard');
  }
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
children: [
  Text('Bo',style: TextStyle(color: color,fontSize: 100.sp,fontWeight: FontWeight.w600),),
  SizedBox(height: 80,width: 80,child: CircularProgressIndicator(color: color,strokeWidth: 8.r,)),
  Text('ky',style: TextStyle(color: color,fontSize: 100.sp,fontWeight: FontWeight.w600),),
],
  ),),
);
  }
}