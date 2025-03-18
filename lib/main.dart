import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user.dart';
import 'package:taskmate_app/Features/login/data/model/user_model_hive/user_model_h.dart';
import 'package:taskmate_app/Features/login/data/repo/login_repo_impl.dart';
import 'package:taskmate_app/Features/login/data/service/login_repo_service.dart';
import 'package:taskmate_app/Features/login/presentation/managers/login_cubit.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';
import 'package:taskmate_app/core/constants/constant.dart';
import 'package:taskmate_app/core/language/language_cubit_cubit.dart';
import 'package:taskmate_app/core/routes.dart';
import 'package:taskmate_app/core/theme/theme_cubit.dart';
import 'package:taskmate_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // تأكد من تهيئة Hive قبل الاستخدام

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isAdapterRegistered(33)) {
    Hive.registerAdapter(UserDataAdapter());
  }

  if (!Hive.isBoxOpen('userBox')) {
    await Hive.openBox<UserData>('userBox');
  }

  if (!Hive.isBoxOpen('tokenBox')) {
    await Hive.openBox<String>('tokenBox');
  }

  if (!Hive.isBoxOpen(kThemeBox)) {
    await Hive.openBox<int>(kThemeBox);
  }

  // 🔥 تحميل التوكن من SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("auth_token");
  String? refresh = prefs.getString("access_token");

  if (token != null) {
    DioWrapper().setToken(token);
    print("🔄 Loaded Token: $token");
  }

  if (refresh != null) {
    DioWrapper().handleTokenRefresh();
    print("🔄 Loaded Refresh Token: $refresh");
  }
  runApp(
    MultiBlocProvider(
      providers: [
         BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
             LoginRepoImpl(
            loginService: LoginService(DioWrapper()), // ✅ استخدام DioWrapper
          ),
          ),
        ),
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
        String languageCode = "ar"; 
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
