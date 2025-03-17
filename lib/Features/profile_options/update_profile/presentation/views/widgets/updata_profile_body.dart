import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/widgets/avatar_profile.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';
import 'package:taskmate_app/core/constants/assets.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';

class UpdataProfileBody extends StatelessWidget {
  const UpdataProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const ProfileAvatar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          CustomTextFormField(
            hint: S.of(context).name,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          CustomButton(
              color: ColorManager.primary,
              height: 50,
              text: S.of(context).save,
              textStyle: AppStyles.styleSomarSansSemiBold26(context)
                  .copyWith(fontSize: 20, color: Colors.white),
              onPressed: () {})
        ],
      ),
    );
  }
}
