import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/managers/update_profile_cubit.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/widgets/avatar_profile.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';

class UpdataProfileBody extends StatefulWidget {
  const UpdataProfileBody({super.key});
  
  @override
  State<UpdataProfileBody> createState() => _UpdataProfileBodyState();
}

class _UpdataProfileBodyState extends State<UpdataProfileBody> {
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          IconButton(
                    onPressed: () {
                      GoRouter.of(context).go('/bottomNavBar');
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
          const ProfileAvatar(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          CustomTextFormField(
            hint: S.of(context).name,
            controller: _usernameController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileSuccess) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success, // ✅ تغيير النوع إلى success
                  animType: AnimType.scale,
                  title: S.of(context).success,
                  desc: S.of(context).profile_updated_successfully,
                  btnOkOnPress: () {},
                ).show();
              } else if (state is UpdateProfileFailure) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.scale,
                  title: S.of(context).error,
                  desc: state.errorMassage, // ✅ تصحيح اسم المتغير
                  btnOkOnPress: () {},
                ).show();
              }
            },
            builder: (context, state) {
              return CustomButton(
                color: ColorManager.primary,
                height: 50,
                text: state is UpdateProfileLoading ? S.of(context).loading : S.of(context).save,
                textStyle: AppStyles.styleSomarSansSemiBold26(context)
                    .copyWith(fontSize: 20, color: Colors.white),
                onPressed: state is UpdateProfileLoading 
    ? () {} // ✅ تمرير دالة فارغة بدلاً من `null`
    : () { 
        context.read<UpdateProfileCubit>().updateProfile(
          username: _usernameController.text.trim(),
        );
      },

              );
            },
          ),
        ],
      ),
    );
  }
}
