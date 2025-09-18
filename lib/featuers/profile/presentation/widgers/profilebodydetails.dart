
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/featuers/auth/preasntation/manger/authcubit/authcubit.dart';
import 'package:gp/featuers/profile/presentation/widgers/profileoptions.dart';

class Profiledetails extends StatelessWidget {
  const Profiledetails({
    super.key,
    required this.imageUrl,
    required this.firstName,
    required this.email,
  });

  final String imageUrl;
  final String firstName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
         SizedBox(
          height: 80.h,
        ),
        Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 75.r,
              backgroundImage:
                  imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
              child: imageUrl.isEmpty
                  ? Text(
                       firstName.isNotEmpty 
              ? firstName[0].toUpperCase() 
              : email.isNotEmpty ? email[0].toUpperCase() : '',
                         
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
                  style:  TextStyle(
                      fontSize: 14,
                      color: color,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/Edit_Pen_Icon.png')
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
          onTap: () {
            Navigator.pushNamed(context, "/faq");
          },
          icon: Icons.question_answer,
          title: 'Faq',
        ),
       
        ProfileOptions(
          onTap: () {
        Navigator.pushNamed(context, '/policy');
          },
          icon: Icons.security,
          title: 'Privacy & Policy',
        ),
        ProfileOptions(
          onTap: () {
            Navigator.pushNamed(context, '/terms');
          },
          icon: Icons.article,
          title: 'condtion & terms',
        ),
         ProfileOptions(
          onTap: () async {
         Popups().showLogoutConfirmationDialog(context, () { 
BlocProvider.of<AuthCubit>(context).logout();
         });
            
          },
          icon: Icons.logout,
          title: 'Log out',
        ),
      ],
    );
  }
}

//Icons.person
//Icons.question_answer
//Icons.logout