import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/constants/assets.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/core/resources/font_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2)); // تأخير بسيط لمحاكاة التحميل

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");

    if (token != null) {
      var box = Hive.box<UserData>('userBox');
      UserData? user = box.get("user");

      if (user != null) {
        GoRouter.of(context).go('/home'); // تحويل المستخدم إلى الصفحة الرئيسية
        return;
      }
    }

    GoRouter.of(context).go('/login'); // تحويل المستخدم إلى تسجيل الدخول
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesGroup270),
              const SizedBox(height: 60),
              Text(
                S.of(context).task_management,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeightManager.regular,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: CustomButton(
                  color: ColorManager.primary,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  icon: Image.asset(
                    Assets.imagesArrowSpalsh,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    GoRouter.of(context).go('/register');
                  },
                  text: S.of(context).lets_start,
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
