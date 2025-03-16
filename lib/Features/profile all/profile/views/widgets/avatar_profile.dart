import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;

  const ProfileAvatar(
      {required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
