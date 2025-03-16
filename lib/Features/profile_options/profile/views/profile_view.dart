import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile_options/profile/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body:  ProfileViewBody(),
    );
  }
}
