import 'package:flutter/material.dart';

class AppTheme {
  static final primaryColor = Color(0XFF3632D5);
  // Light theme using seed color
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.yellow, // Primary seed color
      brightness: Brightness.light,
      // Custom overrides
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: Colors.yellow.shade100,
      onPrimaryContainer: Colors.yellow.shade900,
      secondary: Colors.yellowAccent,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
      
    ),
    textTheme: const TextTheme(
      // bodyLarge: TextStyle(color: Colors.black87),
      // bodyMedium: TextStyle(color: Colors.black87),
      // titleSmall: TextStyle(fontWeight: FontWeight.w400),
    ),
  );

  // Dark theme using seed color
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red, // Primary seed color
      brightness: Brightness.dark,
      // Custom overrides for red text
      onSurface: Colors.red,
      onPrimaryContainer: Colors.red.shade100,
      onSecondaryContainer: Colors.red.shade100,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.red),
      bodyMedium: TextStyle(color: Colors.red),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow.shade800,
      foregroundColor: Colors.red,
      centerTitle: true,
      elevation: 0,
    ),
  );
}
