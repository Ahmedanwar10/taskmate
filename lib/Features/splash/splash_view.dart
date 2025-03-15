import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/constants/assets.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/core/resources/font_manager.dart';
import 'package:taskmate_app/generated/l10n.dart'; // استيراد ملف الترجمة

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
                S.of(context).task_management, // استبدال النصوص بالترجمة
                style: const TextStyle(
                  fontSize: FontSizeManager.s22,
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
                  textStyle: AppStyles.styleSomarSansBold16(context)
                      .copyWith(color: Colors.white), // استخدام الترجمة
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
