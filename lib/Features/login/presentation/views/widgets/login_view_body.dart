import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskmate_app/Features/login/presentation/managers/login_cubit.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/function/show_awesome_dialoge.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/core/routes.dart';
import 'package:taskmate_app/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// ✅ التحقق من البريد الإلكتروني
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).email_required; // رسالة خطأ عند تركه فارغًا
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value.trim())) {
      return S.of(context).invalid_email; // رسالة خطأ عند الصيغة غير الصحيحة
    }
    return null;
  }

  /// ✅ التحقق من كلمة المرور
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).password_required; // رسالة خطأ عند تركه فارغًا
    }
    return null;
  }
 bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showAwesomeDialouge(context, message: state.errorMessage);
        }
        if (state is LoginSuccess) {
           
                  showAwesomeDialouge(
                    context,
                    message: S.of(context).login_successfully,
                    title: S.of(context).login_success_title,
                    buttonColor: ColorManager.primary,
                    dialogType: DialogType.success,
                    onOkPressed: () {
                      GoRouter.of(context)
                          .go('/home'); // ✅ الانتقال يتم بعد الضغط على OK
                    },
                  );        }else if (state is LoginLoading) {
          setState(() => isLoading = true);
          
          }
      },
      builder: (context, state) {

        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CircularProgressIndicator(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Center(
                        child: Text(S.of(context).login,
                            style: AppStyles.styleSomarSansBold20(context))),
                    const SizedBox(height: 20),

                    /// 📌 إدخال البريد الإلكتروني مع التحقق
                    Text(S.of(context).email,
                        style: AppStyles.styleSomarSansBold12(context)),
                    CustomTextFormField(
                      hint: S.of(context).enter_your_email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail, // ✅ التحقق من البريد الإلكتروني
                    ),
                    const SizedBox(height: 18),

                    /// 📌 إدخال كلمة المرور مع التحقق
                    Text(S.of(context).password,
                        style: AppStyles.styleSomarSansBold12(context)),
                    CustomTextFormField(
                      hint: S.of(context).enter_your_password,
                      isSecure: true,
                      controller: passwordController,
                      validator: validatePassword, // ✅ التحقق من كلمة المرور
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                    /// 🔵 زر تسجيل الدخول مع التحقق
                    CustomButton(
                      color: ColorManager.primary,
                      width: double.infinity,
                      height: 50,
                      text: S.of(context).login,
                      textStyle: AppStyles.styleSomarSansSemiBold26(context)
                          .copyWith(fontSize: 20, color: Colors.white),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 8),

                    /// 🔵 رابط التسجيل في حالة عدم وجود حساب
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).go('/register');
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: S.of(context).dont_have_account,
                                style: AppStyles.styleSomarSansBold12(context),
                              ),
                              TextSpan(
                                text: S.of(context).register,
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
          ),
        );
      },
    );
  }
}
