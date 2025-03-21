import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/login/data/repo/login_repo_impl.dart';
import 'package:taskmate_app/Features/login/data/service/login_repo_service.dart';
import 'package:taskmate_app/Features/login/presentation/managers/login_cubit.dart';
import 'package:taskmate_app/Features/login/presentation/views/widgets/login_view_body.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}
