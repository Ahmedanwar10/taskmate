import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/register/widgets/register_view_body.dart';
import 'package:taskmate_app/core/constants/assets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: const RegisterViewBody()),
    );
  }
}
