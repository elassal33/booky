import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body:const Padding(
        padding:  EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'At Booky, we are committed to protecting your privacy and personal data. '
                'This Privacy Policy outlines how we collect, use, and safeguard your information when you use our app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '1. Information We Collect',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- Account details (name, email, password)\n'
                '- Purchase and payment history\n'
                '- Book interactions and favorites\n'
                '- Device information for improving app performance',
              ),
              SizedBox(height: 16),
              Text(
                '2. How We Use Your Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '- To provide access to purchased books\n'
                '- To recommend books based on your reading habits\n'
                '- To handle transactions and provide customer support\n'
                '- To improve app functionality and experience',
              ),
              SizedBox(height: 16),
              Text(
                '3. Data Security',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'We use secure technologies and encryption to protect your data. We never share or sell your personal information to third parties.',
              ),
              SizedBox(height: 16),
              Text(
                '4. Changes to this Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'We may update this policy occasionally. Continued use of Booky after changes means you accept the new policy.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
