import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile/views/widgets/avatar_profile.dart';
import 'package:taskmate_app/core/constants/assets.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProfileAvatar(
              imagePath: Assets.imagesIMG20240225174536993,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
