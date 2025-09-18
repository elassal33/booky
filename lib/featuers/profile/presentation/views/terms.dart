import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body:const Padding(
        padding:  EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Booky. By using our app, you agree to the following terms and conditions. '
                'Please read them carefully before using the service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '1. Use of Service',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Booky allows you to browse, purchase, and read digital books. You agree to use the app only for lawful purposes.',
              ),
              SizedBox(height: 16),
              Text(
                '2. Digital Purchases',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'All purchases made in Booky are non-refundable and linked to your account. Books are for personal use only.',
              ),
              SizedBox(height: 16),
              Text(
                '3. User Accounts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'You are responsible for maintaining the confidentiality of your account. Do not share your login credentials with others.',
              ),
              SizedBox(height: 16),
              Text(
                '4. Intellectual Property',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'All book content and app design are protected by copyright. Reproduction or redistribution is prohibited without permission.',
              ),
              SizedBox(height: 16),
              Text(
                '5. Changes to Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'We may update these terms at any time. It is your responsibility to review them regularly. Continued use of Booky means acceptance of the changes.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
