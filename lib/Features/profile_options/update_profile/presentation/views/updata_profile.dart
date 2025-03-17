import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/widgets/updata_profile_body.dart';
import 'package:taskmate_app/core/app_style.dart';

class  UpdataProfile extends StatelessWidget {
  const  UpdataProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.styleSomarSansBold18(context).color,
      body: UpdataProfileBody(),
    );
  }
}