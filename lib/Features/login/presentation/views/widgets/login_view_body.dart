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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showAwesomeDialouge(context, message: state.errorMessage);
        }
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.homeRoute);
        }
      },
      builder: (context, state) {
        bool isLoading = state is LoginLoading;

        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CircularProgressIndicator(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).login, style: AppStyles.styleSomarSansBold20(context)),
                  const SizedBox(height: 20),
                  Text(S.of(context).email, style: AppStyles.styleSomarSansBold12(context)),
                  CustomTextFormField(
                    hint: S.of(context).enter_your_email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 18),
                  Text(S.of(context).password, style: AppStyles.styleSomarSansBold12(context)),
                  CustomTextFormField(
                    hint: S.of(context).enter_your_password,
                    isSecure: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    color: ColorManager.primary,
                    width: double.infinity,
                    height: 50,
                    text: S.of(context).login,
                    textStyle: AppStyles.styleSomarSansSemiBold26(context).copyWith(fontSize: 20, color: Colors.white),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


