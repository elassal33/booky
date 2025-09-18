import 'package:flutter/material.dart';
import 'package:gp/featuers/auth/preasntation/views/changepasswoedscreen.dart';
import 'package:gp/featuers/auth/preasntation/views/forgetpasswordscreen.dart';
import 'package:gp/featuers/auth/preasntation/views/loginscreen.dart';
import 'package:gp/featuers/auth/preasntation/views/otpscreen.dart';
import 'package:gp/featuers/auth/preasntation/views/signupscreen.dart';
import 'package:gp/featuers/home/presntation/views/authorscreen.dart';
import 'package:gp/featuers/home/presntation/views/bookdetials.dart';
import 'package:gp/featuers/home/presntation/views/homescreen.dart';
import 'package:gp/featuers/main/presentation/views/MainScreen.dart';
import 'package:gp/featuers/onboardingscreen/preasntation/view/onboardingscreen.dart';
import 'package:gp/featuers/pdf/presentaion/views/pdf.dart';
import 'package:gp/featuers/playrecord/preasntation/views/bookrecord.dart';
import 'package:gp/featuers/profile/presentation/views/contactus.dart';
import 'package:gp/featuers/profile/presentation/views/editprofile.dart';
import 'package:gp/featuers/profile/presentation/views/faq.dart';
import 'package:gp/featuers/profile/presentation/views/policy.dart';
import 'package:gp/featuers/profile/presentation/views/terms.dart';

import 'package:gp/featuers/splash/presntation/veiws/splashscreen.dart';
import 'package:gp/featuers/welcomescreen/preasntation/views/welcomscreen.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/onboard': (context) =>const OnboardingScreen(),
      '/splash': (context) =>const SplashScreen(),
      '/welcome': (context) =>const WelcomScreen(), 
      '/Login': (context) =>const LoginScreen(), 
      '/Sign up': (context) =>const SignupScreen(), 
      '/home': (context) =>const HomeScreen(), 
      '/main': (context) =>const MainScreen(), 
      '/bookdetails': (context) =>const BookDetails(), 
      '/pdf': (context) =>const Pdfs(), 
      '/bookrecord': (context) =>const BookRecord(), 
      '/author': (context) =>const Authorscreen(), 
      '/Forget Password': (context) =>const ForgetPassword(), 
      '/otp code': (context) =>const OtpScreen(), 
      '/Change Password': (context) =>const ChangePassword(), 
      '/policy': (context) =>const PrivacyPolicyPage(), 
      '/terms': (context) =>const TermsAndConditionsPage(), 
      '/contact us': (context) =>const Contactus(), 
      '/faq': (context) =>const FaqPage(), 
      '/mybooks': (context) =>const ChangePassword(), 
      '/edit profile': (context) =>const EditProfile(), 
   
    
    };
  }
}
