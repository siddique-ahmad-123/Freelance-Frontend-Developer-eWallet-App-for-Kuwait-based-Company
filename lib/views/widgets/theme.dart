import 'package:flutter/material.dart';

class AppTheme {
  // Define primary and accent colors
  static const Color primaryColor = Color(0xFF2E3187);
  static const Color accentColor = Color(0xFF6C63FF);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color buttonColor = Color(0xFF222766);
  static const Color buttonTextColor = Color(0xFFFFFFFF);

  // Manrope TextTheme
  static const TextTheme manropeTextTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFF061237), fontFamily: 'Manrope'),
    bodyMedium: TextStyle(fontSize: 13.0, color: Color(0xFF061237), fontFamily: 'Manrope'),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Manrope'),
  );

  // Poppins TextTheme
  static const TextTheme poppinsTextTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFF061237), fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 13.0, color: Color(0xFF061237), fontFamily: 'Poppins'),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Poppins'),
  );

  // Global theme data
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Manrope', // Set default font
      textTheme: manropeTextTheme, // Set default text theme to Manrope
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: Color(0xFF343434),
        centerTitle: true,
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        buttonColor: buttonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: buttonTextColor,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.black38),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: buttonColor,
        foregroundColor: backgroundColor,
      ),
    );
  }
}
