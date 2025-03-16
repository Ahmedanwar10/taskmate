import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile_options/change_password/presentation/views/widgets/ch_pass_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangePasswordViewBody(),
    );
  }
}