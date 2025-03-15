import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile/views/widgets/profile_view_body.dart';
import 'package:taskmate_app/core/constants/assets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: const ProfileViewBody()),
    );
  }
}
