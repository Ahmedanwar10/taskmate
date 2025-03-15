import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskmate_app/Features/login/data/model/user_model_hive/user_model_h.dart';
import 'package:taskmate_app/core/constants/constant.dart';
import 'package:taskmate_app/core/language/language_cubit_cubit.dart';
import 'package:taskmate_app/core/routes.dart';
import 'package:taskmate_app/core/theme/theme_cubit.dart';
import 'package:taskmate_app/generated/l10n.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized(); // تأكد من تهيئة Flutter
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter()); // ✅ تسجيل الـ Adapter إذا لم يكن مسجلًا
  }

  // ✅ فتح الصندوق فقط إذا لم يكن مفتوحًا
  if (!Hive.isBoxOpen('userBox')) {
    await Hive.openBox<UserModel>('userBox');
  }

  if (!Hive.isBoxOpen(kThemeBox)) {
    await Hive.openBox<int>(kThemeBox); // فتح صندوق الثيم فقط عند الحاجة
  } // فتح صندوق الثيم

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubitCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubitCubit, LanguageCubitState>(
      builder: (context, langState) {
        String languageCode = "ar"; // اللغة الافتراضية
        if (langState is LanguageChange) {
          languageCode = langState.selectedLanguage;
        }

        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              title: 'TaskMate',
              locale: Locale(languageCode),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: BlocProvider.of<ThemeCubit>(context).themeData,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRoutes.router,
            );
          },
        );
      },
    );
  }
}
