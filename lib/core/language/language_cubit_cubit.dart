import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_cubit_state.dart';

class LanguageCubitCubit extends Cubit<LanguageCubitState> {
  LanguageCubitCubit() : super(LanguageCubitInitial());
  String getCurrentLanguage() {
    if (state is LanguageChange) {
      return (state as LanguageChange).selectedLanguage;
    }
    return 'عربي';
  }

  void changeLanguage(String selectedLanguage) {
    emit(LanguageChange(selectedLanguage));
  }
}
