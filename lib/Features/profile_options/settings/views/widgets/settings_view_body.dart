import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/profile_options/settings/views/widgets/theme_setting.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/core/language/language_cubit_cubit.dart';
import 'package:taskmate_app/generated/l10n.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubitCubit, LanguageCubitState>(
      builder: (context, state) {
        String currentLanguage =
            context.read<LanguageCubitCubit>().state is LanguageChange
                ? (context.read<LanguageCubitCubit>().state as LanguageChange)
                    .selectedLanguage
                : 'ar';
        bool isArabic = currentLanguage == 'ar';
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).language,
                      style: AppStyles.styleSomarSanssemiBold10(context),
                    ),
                    Switch(
                      value: isArabic,
                      onChanged: (bool newValue) {
                        context
                            .read<LanguageCubitCubit>()
                            .changeLanguage(newValue ? 'ar' : 'en');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const ThemeSetting(),
            ],
          ),
        );
      },
    );
  }
}
