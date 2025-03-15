import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary:
        const Color(0xff0000000).withOpacity(0.1), // for Customized containers
    secondary: Colors.white, // for text form field
    // tertiary: kPrimaryColor,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff121212),
    primary: Color(0xff444444), // for Customized containers
    secondary: Color(0xff444444), // for text form field
    // tertiary: Color(0xff1B262C),
  ),
);
