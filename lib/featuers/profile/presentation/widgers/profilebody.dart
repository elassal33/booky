import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authstates.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilesates.dart';
import 'package:gp/featuers/profile/presentation/widgers/profileoptions.dart';
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
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 90,
                    backgroundImage:
                        imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                    child: imageUrl.isEmpty
                        ? Text(
                            firstName.isNotEmpty
                                ? firstName[0].toUpperCase()
                                : '',
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          )
                        : null,
                  )),
              const SizedBox(
                height: 10,
              ),
              Align(alignment: Alignment.center,
                child: Text(
                  email,
                  style: const TextStyle(
                      fontSize: 14, color: color, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/edit profile'),
                      child: const Text(
                        'Edit Profile',
                        style: const TextStyle(
                            fontSize: 14,
                            color: color,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset('assest/images/Edit_Pen_Icon.png')
                  // Icon(Icons.edit_outlined,color: color,)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileOptions(
                onTap: () {
                  Navigator.pushNamed(context, '/contact us');
                },
                icon: Icons.person,
                title: 'Contact Us',
              ),
              ProfileOptions(
                onTap: () {},
                icon: Icons.question_answer,
                title: 'Faq',
              ),
              ProfileOptions(
                onTap: () async {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
                icon: Icons.logout,
                title: 'Log out',
              ),
              ProfileOptions(
                onTap: () {},
                icon: Icons.security,
                title: 'Privacy & Policy',
              ),
              ProfileOptions(
                onTap: () {},
                icon: Icons.article,
                title: 'condtion & terms',
              ),
            ],
          ),
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
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 90,
                    backgroundImage:
                        imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                    child: imageUrl.isEmpty
                        ? Text(
                            firstName.isNotEmpty
                                ? firstName[0].toUpperCase()
                                : '',
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          )
                        : null,
                  )),
              const SizedBox(
                height: 10,
              ),
              Align(alignment: Alignment.center,
                child: Text(
                  email,
                  style: const TextStyle(
                      fontSize: 14, color: color, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/edit profile'),
                      child: const Text(
                        'Edit Profile',
                        style: const TextStyle(
                            fontSize: 14,
                            color: color,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset('assest/images/Edit_Pen_Icon.png')
                  // Icon(Icons.edit_outlined,color: color,)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileOptions(
                onTap: () {
                  Navigator.pushNamed(context, '/contact us');
                },
                icon: Icons.person,
                title: 'Contact Us',
              ),
              ProfileOptions(
                onTap: () {},
                icon: Icons.question_answer,
                title: 'Faq',
              ),
              ProfileOptions(
                onTap: () async {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
                icon: Icons.logout,
                title: 'Log out',
              ),
              ProfileOptions(
                onTap: () {},
                icon: Icons.security,
                title: 'Privacy & Policy',
              ),
              ProfileOptions(
                onTap: () {},
                icon: Icons.article,
                title: 'condtion & terms',
              ),
            ],
          ),
        );
  }
       
      },
    );
  }
}

//Icons.person
//Icons.question_answer
//Icons.logout