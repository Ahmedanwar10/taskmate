import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/core/constants/constant.dart';
import 'package:taskmate_app/core/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  ThemeData _themeData =
      Hive.box<int>(kThemeBox).get(0) == 1 ? darkMode : lightMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
      Hive.box<int>(kThemeBox).put(0, 1);
    } else {
      _themeData = lightMode;
      Hive.box<int>(kThemeBox).put(0, 0);
    }
    emit(ThemeInitial());
  }
}
