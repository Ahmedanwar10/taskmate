import 'package:flutter/material.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';

abstract class AppTheme {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: ColorManager.white,
      primary: ColorManager.lightGrey,
      secondary: ColorManager.lightGrey,
    ),
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF181818),
    colorScheme: const ColorScheme.dark(
      surface: ColorManager.darkGrey,
      primary: Color(0xFFF5F5F5),
      secondary: ColorManager.darkGrey, // ✅ لأماكن الإدخا
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // ✅ لون النص الأساسي
      bodyMedium: TextStyle(color: Colors.white70), // ✅ لون النص الثانوي
    ),
  );
}
