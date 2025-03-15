import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskmate_app/Features/register/presentation/managers/register_cubit.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/function/show_awesome_dialoge.dart';
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
  bool isLoading = false;

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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).email_required;
    }
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value)) {
      return S.of(context).invalid_email;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).password_required;
    }
    if (value.length < 6) {
      return S.of(context).Password_must_be_at_least_6_characters_long;
    }
    final passwordRegex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$");
    if (!passwordRegex.hasMatch(value)) {
      return S.of(context).The_password_must_contain_letters_and_numbers;
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).password_confirmation_required;
    }
    if (value != passwordController.text) {
      return S.of(context).password_confirmation_same;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  setState(() => isLoading = false);
                  showAwesomeDialouge(
                    context,
                    message: S.of(context).register_successfully,
                    title: S.of(context).register_success_title,
                    buttonColor: ColorManager.primary,
                    dialogType: DialogType.success,
                    onOkPressed: () {
                      GoRouter.of(context)
                          .go('/login'); // ✅ الانتقال يتم بعد الضغط على OK
                    },
                  );
                } else if (state is RegisterFailure) {
                  setState(() => isLoading = false);
                  showAwesomeDialouge(
                    context,
                    message: state.errorMessage,
                    buttonColor: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: isLoading,
                  progressIndicator: const CircularProgressIndicator(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Center(
                          child: Text(
                            S.of(context).register,
                            style: AppStyles.styleSomarSansBold20(context),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Text(S.of(context).email,
                            style: AppStyles.styleSomarSansBold12(context)),
                        const SizedBox(height: 9),
                        CustomTextFormField(
                          hint: S.of(context).enter_your_email,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 18),
                        Text(S.of(context).password,
                            style: AppStyles.styleSomarSansBold12(context)),
                        const SizedBox(height: 9),
                        CustomTextFormField(
                          hint: S.of(context).enter_your_password,
                          isSecure: true,
                          controller: passwordController,
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 18),
                        Text(S.of(context).confirm_password,
                            style: AppStyles.styleSomarSansBold12(context)),
                        const SizedBox(height: 9),
                        CustomTextFormField(
                          hint: S.of(context).confirm_password,
                          isSecure: true,
                          controller: confirmPasswordController,
                          validator: validateConfirmPassword,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Center(
                          child: CustomButton(
                            text: S.of(context).register,
                            color: ColorManager.primary,
                            width: double.infinity,
                            height: 50,
                            textStyle:
                                AppStyles.styleSomarSansSemiBold26(context)
                                    .copyWith(
                                        fontSize: 20, color: Colors.white),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() => isLoading = true);
                                await BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                  username: emailController.text,
                                  password: passwordController.text,
                                );
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
                                    style:
                                        AppStyles.styleSomarSansBold12(context),
                                  ),
                                  TextSpan(
                                    text: S.of(context).login,
                                    style:
                                        AppStyles.styleSomarSansBold12(context)
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
