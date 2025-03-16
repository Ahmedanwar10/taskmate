import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile_options/profile/views/widgets/avatar_profile.dart';
import 'package:taskmate_app/core/constants/assets.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(
          imagePath: Assets.imagesIMG20240225174536993,
        // onTap: () => GoRouter.of(context).go('/profile'),
        ),
        const SizedBox(width: 13),
         const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Welcome to TaskMate'),
            SizedBox(height: 4.5),
            Text('Ahmed Anwar'),
          ],
        ),
      ],
    );
  }
}