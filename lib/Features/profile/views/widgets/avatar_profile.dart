import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ProfileAvatar(
      {required this.imagePath, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
