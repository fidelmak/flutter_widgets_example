import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;

  // Customizable properties
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  CustomTextField({
    required this.label,
    required this.hintText,
    this.controller,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ??
              TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Colors.black,
              ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: Color(0xff9CA3AF),
                ),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? Color(0xff9CA3AF)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? Color(0xff9CA3AF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:
                  BorderSide(color: focusedBorderColor ?? Color(0xff007198)),
            ),
          ),
        ),
      ],
    );
  }
}
