import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/profile/presentation/widgers/profiletextfield.dart';
class NameFieldsRow extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final Function(String?) onFirstNameChanged;
  final Function(String?) onLastNameChanged;

  const NameFieldsRow({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('First name',
                style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500)),
            ProfileTextField(
              lastname: firstNameController,
              limit: 10,
              hint: 'First name',
              onChanged:onFirstNameChanged,
              width: 150,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Last name',
                style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500)),
            ProfileTextField(
              lastname: lastNameController,
              limit: 10,
              hint: 'Last name',
              onChanged: onLastNameChanged,
              width: 150,
            ),
          ],
        ),
      ],
    );
  }
}
