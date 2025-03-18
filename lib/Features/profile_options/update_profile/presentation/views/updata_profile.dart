import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/repo/repo_update_profile_impl.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/service/update_profile_repo_service.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/managers/update_profile_cubit.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/widgets/updata_profile_body.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class UpdataProfile extends StatelessWidget {
  const UpdataProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.styleSomarSansBold18(context).color,
      body: BlocProvider(
        create: (context) => UpdateProfileCubit(
          RepoUpdateProfileImpl(updateProfileRepoService: UpdateProfileRepoService(DioWrapper())),
        ),
        child:const  UpdataProfileBody(),
      ),
    );
  }
}
