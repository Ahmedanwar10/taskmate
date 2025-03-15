import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Center(
                    child: Text(
                      S.of(context).register,
                      style: AppStyles.styleSomarSansBold20(context),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Text(
                    S.of(context).email,
                    style: AppStyles.styleSomarSansBold12(context),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    hint: S.of(context).enter_your_email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    S.of(context).password,
                    style: AppStyles.styleSomarSansBold12(context),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    hint: S.of(context).enter_your_password,
                    isSecure: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    S.of(context).confirm_password,
                    style: AppStyles.styleSomarSansBold12(context),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    hint: S.of(context).confirm_password,
                    isSecure: true,
                    controller: confirmPasswordController,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Center(
                    child: CustomButton(
                      text: S.of(context).register,
                      color: ColorManager.primary,
                      width: double.infinity,
                      height: 50,
                      textStyle: AppStyles.styleSomarSansSemiBold26(context)
                          .copyWith(fontSize: 20, color: Colors.white),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          GoRouter.of(context).go('/login');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/login');
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).already_have_account,
                              style: AppStyles.styleSomarSansBold12(context),
                            ),
                            TextSpan(
                              text: S.of(context).login,
                              style: AppStyles.styleSomarSansBold12(context)
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
