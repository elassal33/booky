
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilesates.dart';
import 'package:gp/featuers/profile/presentation/widgers/profilebodydetails.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String email = '';
  String imageUrl = "";
  @override
  void initState() {
    super.initState();

    _loadUserInfo();
  }

  String firstName = '';
  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = UserPrefs(prefs);
    final user = userPrefs.getUser();
    setState(() {
      email = user['email'] ?? '';
      firstName = user['firstName'] ?? '';

      imageUrl = user['image'] ?? '';
    });
    
print(firstName);
  }

  clear() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = UserPrefs(prefs);
    userPrefs.clearUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditeprofileCubit, EditeProfileStates>(
      builder: (context, state) {
  if (state is EditDone) {
    _loadUserInfo();
     return BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is Logout) {
              clear();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/Login', (route) => false);
            }
          },
          child: Profiledetails(imageUrl: imageUrl, firstName: firstName, email: email),
        );
  } else {
     return BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is Logout) {
              clear();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/Login', (route) => false);
            }
          },
          child: Profiledetails(imageUrl: imageUrl, firstName: firstName, email: email),
        );
  }
       
      },
    );
  }
}

