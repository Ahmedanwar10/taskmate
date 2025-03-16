part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeChanged extends ThemeState {
  final ThemeData themeData;
  ThemeChanged(this.themeData);
}