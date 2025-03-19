import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/profile_options/change_password/data/repo/repo_change_pas_impl.dart';
import 'package:taskmate_app/Features/profile_options/change_password/data/service/api_service_ch_pass.dart';
import 'package:taskmate_app/Features/profile_options/change_password/presentation/managers/change_password_cubit.dart';
import 'package:taskmate_app/Features/profile_options/change_password/presentation/views/widgets/ch_pass_view_body.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChangePasswordCubit(
          RepoChangePasImpl(
            changePasswordService: ChangePasswordRepoService(DioWrapper()),
          ),
        ),
        child: const ChangePasswordViewBody(),
      ),
    );
  }
}
