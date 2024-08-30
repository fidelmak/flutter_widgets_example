import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CustomFooter({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
