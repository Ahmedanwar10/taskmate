import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/core/constants/constant.dart';
import 'package:taskmate_app/core/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeChanged(Hive.box<int>(kThemeBox).get(0, defaultValue: 0) == 1
            ? AppTheme.darkMode
            : AppTheme.lightMode));

  ThemeData get themeData {
    if (state is ThemeChanged) {
      return (state as ThemeChanged).themeData;
    }
    return AppTheme.lightMode;
  }

  void toggleTheme() {
    final isDarkMode = themeData == AppTheme.lightMode;
    final newTheme = isDarkMode ? AppTheme.darkMode : AppTheme.lightMode;
    Hive.box<int>(kThemeBox).put(0, isDarkMode ? 1 : 0);

    emit(ThemeChanged(newTheme));
  }
}
