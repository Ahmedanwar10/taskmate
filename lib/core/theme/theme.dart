import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Color(0xFFF5F5F5), // لون فاتح للحاويات
      secondary: Colors.white, // لأماكن الإدخال
    ),
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF181818), // ✅ تحسين لون الخلفية
    colorScheme: const ColorScheme.dark(
      surface: Color(0xFFF5F5F5), // ✅ لون الحاويات ليكون واضحًا أكثر
      primary: Color(0xFFF5F5F5), // ✅ لون أكثر تناسقًا لعناصر الواجهة
      secondary: Color(0xFFF5F5F5), // ✅ لأماكن الإدخال
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // ✅ لون النص الأساسي
      bodyMedium: TextStyle(color: Colors.white70), // ✅ لون النص الثانوي
    ),
  );
}
