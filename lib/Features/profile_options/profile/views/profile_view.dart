import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile_options/profile/views/widgets/profile_view_body.dart';
import 'package:taskmate_app/core/app_style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppStyles.styleSomarSansBold18(context).color,
      body:  const ProfileViewBody(),
    );
  }
}
