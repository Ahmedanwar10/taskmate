part of 'language_cubit_cubit.dart';

@immutable
abstract class LanguageCubitState {}

class LanguageCubitInitial extends LanguageCubitState {}

class LanguageChange extends LanguageCubitState {
  final String selectedLanguage;
  LanguageChange(this.selectedLanguage);
}
