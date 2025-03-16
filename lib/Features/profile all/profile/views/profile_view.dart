import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/profile%20all/profile/views/widgets/profile_view_body.dart';
import 'package:taskmate_app/core/constants/assets.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightGray,
      body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(Assets.imagesBackgroundImage),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: const ProfileViewBody()),
    );
  }
}
