import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/register/data/repo/repo_register_impl.dart';
import 'package:taskmate_app/Features/register/data/service/repo_register_service.dart';
import 'package:taskmate_app/Features/register/presentation/managers/register_cubit.dart';
import 'package:taskmate_app/Features/register/presentation/views/widgets/register_view_body.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';
import 'package:taskmate_app/core/constants/assets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(
          RegisterRepoImpl(registerService:RegisterService(DioWrapper()))
        ),
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: const RegisterViewBody()),
      ),
    );
  }
}
