import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/profile_options/change_password/presentation/managers/change_password_cubit.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final TextEditingController username = TextEditingController();

  void _showConfirmDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'تأكيد تغيير كلمة المرور',
      desc: 'هل أنت متأكد من رغبتك في تغيير كلمة المرور؟',
      btnCancelText: 'إلغاء',
      btnCancelOnPress: () {},
      btnOkText: 'تأكيد',
      btnOkOnPress: () {
        context.read<ChangePasswordCubit>().changePassword(
              username: username.text,
              current_password: oldPassController.text,
              new_password: newPassController.text,
              new_password_confirm: confirmPassController.text,
            );
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.scale,
              title: 'تم بنجاح',
              desc: 'تم تغيير كلمة المرور بنجاح',
              btnOkText: 'موافق',
              btnOkOnPress: () {
                GoRouter.of(context).go('/profile');
              },
            ).show();
          } else if (state is ChangePasswordFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              title: 'خطأ',
              desc: state.errorMassage,
              btnOkText: 'حسناً',
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).go('/profile');
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const SizedBox(width: 20),
                  Center(
                    child: Text(
                      S.of(context).change_password,
                      style: AppStyles.styleSomarSansBold20(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: S.of(context).old_password,
                controller: oldPassController,
                isSecure: true,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: S.of(context).new_password,
                controller: newPassController,
                isSecure: true,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: S.of(context).confirm_new_password,
                controller: confirmPassController,
                isSecure: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              CustomButton(
                color: ColorManager.primary,
                height: 50,
                text: S.of(context).save,
                textStyle: AppStyles.styleSomarSansSemiBold26(context)
                    .copyWith(fontSize: 20, color: Colors.white),
                onPressed: () {
                  _showConfirmDialog(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
