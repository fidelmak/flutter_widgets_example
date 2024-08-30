import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';
// Make sure to adjust the import path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomTextFieldScreen(),
    );
  }
}

class CustomTextFieldScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Text Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Username',
              hintText: 'Enter your username',
              controller: _usernameController,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              borderColor: Colors.blue,
              focusedBorderColor: Colors.blueAccent,
              borderRadius: 12.0,
            ),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              controller: _emailController,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              borderColor: Colors.green,
              focusedBorderColor: Colors.greenAccent,
              borderRadius: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
