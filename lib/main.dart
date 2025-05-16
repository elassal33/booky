import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/core/utilits/routs.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favecubit.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbookcubit.dart';
import 'package:gp/featuers/mybooks/presentation/manger/purchasedbookscubit/purchasedbookscubit.dart';


import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/firebase_options.dart';
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
  
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
 BlocProvider<EditeprofileCubit>(
      create: (context) => EditeprofileCubit(),
    ),
 BlocProvider<Suggestedbookscubit>(
      create: (context) => Suggestedbookscubit(),
    ),
 BlocProvider<Purchasedbookscubit>(
      create: (context) => Purchasedbookscubit(),
    ),
 BlocProvider<FavCubit>(
      create: (context) => FavCubit(),
    ),
  
   
   
   
 
    ],
     
      child: ScreenUtilInit(
        designSize: const Size(412, 917),
        splitScreenMode: true,
        minTextAdapt: true,
        child: MaterialApp(
           navigatorObservers: [routeObserver], 
          initialRoute: '/splash',
          routes: Routes.getRoutes(),
          theme: ThemeData(fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
