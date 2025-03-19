import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/profile_options/settings/views/widgets/settings_view_body.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).go('/bottomNavBar');
          },
        ),
        centerTitle: true,
        title: Text(
          S.of(context).settings,
          style: AppStyles.styleSomarSanssemiBold10(context),
        ),
      ),
      body: const SettingViewBody(),
    );
  }
}
