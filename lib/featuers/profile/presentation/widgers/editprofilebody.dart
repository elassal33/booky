import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/profile/presentation/manger/birthdatecubit/birthdatecubit.dart';
import 'package:gp/featuers/profile/presentation/manger/birthdatecubit/birthdatestates.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilesates.dart';
import 'package:gp/featuers/profile/presentation/widgers/imageavatar.dart';
import 'package:gp/featuers/profile/presentation/widgers/profilebotton.dart';
import 'package:gp/featuers/profile/presentation/widgers/profiletextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofilebody extends StatefulWidget {
  const Editprofilebody({super.key});

  @override
  State<Editprofilebody> createState() => _EditprofilebodyState();
}

class _EditprofilebodyState extends State<Editprofilebody> {
   final _formKey = GlobalKey<FormState>();
  String? firstnameerror;
  String? lastnameerror;
  String? phoneerror;


    Map? errors;
   String newurl="";
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController date;

  String? inputtfirstname;
  String? inputtlastname;
  String? inputtphone;
  String? inputtdate;
  String imageUrl ="" ;
 late String tokenn;

  @override
  void initState() {
    super.initState();

    firstname = TextEditingController();
    lastname = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    date = TextEditingController();

    _loadUserInfo();
  }
Future<File> _compressImage(File file) async {
  try {
    // Using flutter_image_compress package
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      file.absolute.path + '_compressed.jpg', // Output path
      quality: 80,                            // Compression quality (0-100)
      minWidth: 800,                          // Minimum width
      minHeight: 800,                         // Minimum height
      rotate: 0,                              // Rotation angle
    );
    
    return File(result!.path);
  } catch (e) {
    // If compression fails, return original file
    return file;
  }
}
 Future<void> _pickImage() async {
  try {
    // Step 1: Pick the image
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1200,       // Limits image width
      maxHeight: 1200,      // Limits image height
      imageQuality: 90,     // Quality percentage (1-100)
    );

    if (pickedFile != null) {
      // Step 2: Compress the image
      final compressedFile = await _compressImage(File(pickedFile.path));
      
      // Step 3: Update state with compressed file
      setState(() {
        _imageFile = compressedFile;
      });
    }
  } catch (e) {
    // Handle any errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to process image: ${e.toString()}')),
    );
  }
}
  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = UserPrefs(prefs);
    final user = userPrefs.getUser();

    setState(() {
      firstname.text = user['firstName'] ?? '';
      lastname.text = user['lastName'] ?? '';
      email.text = user['email'] ?? '';
      phone.text = user['phone'] ?? '';
      date.text = user['birthdate'] ?? '';
      print('date             ${date.text}');
      imageUrl = user['image'] ?? '';
      tokenn = user['token']??'' ;


      inputtfirstname = firstname.text;
      inputtlastname = lastname.text;
      inputtphone = phone.text;
      inputtdate = date.text;
    });
     print("🔵 [LOAD] Retrieved image URL from SharedPreferences: ${user['image']}");

  setState(() {
    imageUrl = user['image'] ?? '';
    print("🟢 [LOAD] Current imageUrl: $imageUrl");
  });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditeprofileCubit, EditeProfileStates>(
      listener: (context, state) async {
        if (state is EditFiald) {
          errors=BlocProvider.of<EditeprofileCubit>(context).errors;
          print(errors);
          if (errors!=null) {
            extractStrings(errors!);
          }

          }
        if (state is EditDone) {
         
    setState(() {
      imageUrl = newurl;
    });
  
         

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(backgroundColor: color,content: Text('Profile updated locally!',style: TextStyle(color: Colors.white),)),
            );
          }
        }
      },
      child: BlocListener<BirthDateCubit, BirthDateStates>(
        listener: (context, state) {
          final selectedDate =
              BlocProvider.of<BirthDateCubit>(context).dateTime;
          if (selectedDate != null) {
            setState(() {
              inputtdate = selectedDate;
              date.text = selectedDate;
            });
          }
        },
        child: Scaffold(
          body: Form(key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              children: [
                const SizedBox(height: 100),
              //  CircleAvatar(backgroundImage: NetworkImage(imageUrl!),)
              ProfileAvatar(imageFile: _imageFile, imageUrl: imageUrl, firstName: firstname.text, onPickImage: _pickImage, onRemoveImage:() {
                            setState(() {
                              _imageFile = null;
                            });
                          }, )
              ,  
               
                const SizedBox(height: 10),
                Row(
  children: [
    // First Name Column
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'First name',
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
           SizedBox(height: 4.h), // Space between label and field
          ProfileTextField(width: 150,
            error: firstnameerror,
            lastname: firstname,
            limit: 10,
            hint: 'First name',
            onChanged: (input) {
              inputtfirstname = input;
              setState(() => firstnameerror = null);
            },
          ),
        ],
      ),
    ),
     SizedBox(width: 16.w), // Fixed spacing instead of Spacer()
    // Last Name Column
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last name',
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4), // Space between label and field
          ProfileTextField(width: 150,
            error: lastnameerror,
            lastname: lastname,
            limit: 10,
            hint: 'Last name',
            onChanged: (input) {
              inputtlastname = input;
              setState(() => lastnameerror = null);
            },
          ),
        ],
      ),
    ),
  ],
),
                const SizedBox(height: 10),
                const Text('Email',
                    style: TextStyle(
                        fontSize: 14, color: color, fontWeight: FontWeight.w500)),
                ProfileTextField(
                  lastname: email,
                  limit: 40,
                  hint: 'Email',
                  onChanged: (_) {},
                  width: 320,
                  
                ),
                const Text('Phone',
                    style: TextStyle(
                        fontSize: 14, color: color, fontWeight: FontWeight.w500)),
                ProfileTextField(error: phoneerror,
                  lastname: phone,
                  limit: 11,
                  hint: 'Phone number',
                  onChanged: (input)  { inputtphone = input; 
                             setState(() =>phoneerror = null);
                          },
                  width: 320,
                ),
                const Text('Birth date',
                    style: TextStyle(
                        fontSize: 14, color: color, fontWeight: FontWeight.w500)),
                ProfileTextField(
                  lastname: date,
                  limit: 10,
                  hint: 'Birthdate',
                  onChanged: (_) {},
                  width: 320,
               
                ),
                const SizedBox(height: 20),
                ProfileBotton(
                  onpressed: () async{
                      if (_formKey.currentState!.validate()) {
                          newurl=await        BlocProvider.of<EditeprofileCubit>(context).updateProfile(
                      fristname: inputtfirstname ?? '',
                      lastname: inputtlastname ?? '',
                      birthdate: inputtdate,
                      image: _imageFile,
                      phone: inputtphone,
                    );
                        }
                   
                    
                  },
                  name: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 extractStrings(Map map) {
  setState(() {
    if (map.containsKey('phone')) {
      phoneerror = map['phone']?.join(', ');
    } else {
      phoneerror = null;
    }

    if (map.containsKey('first_name')) {
      firstnameerror = map['first_name']?.join(', ');
    } else {
      firstnameerror = null;
    }

    if (map.containsKey('last_name')) {
      lastnameerror = map['last_name']?.join(', ');
    } else {
      lastnameerror = null;
    }
  });
}
}
