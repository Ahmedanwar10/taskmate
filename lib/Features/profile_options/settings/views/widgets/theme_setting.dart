import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/core/theme/theme_cubit.dart';
import 'package:taskmate_app/generated/l10n.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = false;

        if (state is ThemeChanged) {
          isDarkMode = state.themeData.brightness == Brightness.dark; // ✅ تصحيح التحقق من الثيم
        }

        return Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // ✅ تعديل البادينج
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).theme,
                      style: AppStyles.styleSomarSansBold20black(context),
                    ),
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (bool newValue) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
