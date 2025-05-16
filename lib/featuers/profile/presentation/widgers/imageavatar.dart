import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gp/const.dart';

class ProfileAvatar extends StatelessWidget {
  final File? imageFile;
  final String imageUrl;
  final String firstName;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  const ProfileAvatar({
    super.key,
    required this.imageFile,
    required this.imageUrl,
    required this.firstName,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 90,
          backgroundColor: color,
          backgroundImage: imageFile != null
              ? FileImage(imageFile!)
              : (imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null)
                  as ImageProvider?,
          child: (imageFile == null&&imageUrl.isEmpty)
              ? Text(
                  firstName.isNotEmpty ? firstName[0].toUpperCase() : '',
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                )
              : null,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onPickImage,
              child: const Icon(Icons.camera_alt, color: color),
            ),
           
          ],
        )
      ],
    );
  }
}
