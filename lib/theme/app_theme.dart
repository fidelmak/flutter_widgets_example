import 'package:flutter/material.dart';

// Define your light color scheme or import them from another file
class LightColor {
  static const Color background = Colors.white;
  static const Color iconColor = Colors.black54;
  static const Color black = Colors.black;
  static const Color lightGrey = Colors.grey;
  static const Color titleTextColor = Colors.black87;
  static const Color subTitleTextColor = Colors.grey;
  static const Color orange = Colors.orange;
}

class AppTheme {
  AppTheme._(); // Private constructor for static class

  // Define your light theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: LightColor.background,
      cardTheme: CardTheme(color: LightColor.background),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: LightColor.black),
        displayLarge: h1Style,
        displayMedium: h2Style,
        displaySmall: h3Style,
        headlineMedium: h4Style,
        headlineSmall: h5Style,
        titleLarge: h6Style,
      ),
      iconTheme: IconThemeData(color: LightColor.iconColor),
      dividerColor: LightColor.lightGrey,
      primaryTextTheme:
          TextTheme(bodyLarge: TextStyle(color: LightColor.titleTextColor)),
      buttonTheme: ButtonThemeData(
        buttonColor: LightColor.orange, // Default button color
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: LightColor.orange),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: LightColor.background),
    );
  }

  // Define text styles
  static TextStyle get titleStyle =>
      TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle get subTitleStyle =>
      TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);
  static TextStyle get h1Style =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle get h2Style => TextStyle(fontSize: 22);
  static TextStyle get h3Style => TextStyle(fontSize: 20);
  static TextStyle get h4Style => TextStyle(fontSize: 18);
  static TextStyle get h5Style => TextStyle(fontSize: 16);
  static TextStyle get h6Style => TextStyle(fontSize: 14);

  // Define shadows
  static List<BoxShadow> get shadow => [
        BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
      ];

  // Define padding
  static EdgeInsets get padding =>
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: 10);

  // Utility methods for screen dimensions
  static double fullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double fullHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
