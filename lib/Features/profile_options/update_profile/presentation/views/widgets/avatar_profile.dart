import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/widgets/profileImagenotifier.dart';
import 'package:taskmate_app/core/constants/assets.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final ImagePicker _picker = ImagePicker();
  bool _isPicking = false;

  Future<void> _pickImage() async {
    if (_isPicking) return;
    _isPicking = true;

    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImageNotifier.value = File(pickedFile.path); // تحديث الصورة
      }
    } catch (e) {
      print("خطأ أثناء اختيار الصورة: $e");
    } finally {
      _isPicking = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
      valueListenable: profileImageNotifier,
      builder: (context, image, child) {
        return GestureDetector(
          onTap: _pickImage,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: image != null
                    ? FileImage(image)
                    : const AssetImage(Assets.imagesIMG20240225174536993) as ImageProvider,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: ColorManager.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, size: 8, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
