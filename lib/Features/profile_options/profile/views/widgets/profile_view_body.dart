import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/login/presentation/managers/login_cubit.dart';
import 'package:taskmate_app/core/common/widgets/build_profile_options.dart';
import 'package:taskmate_app/core/common/widgets/header_home.dart';
import 'package:taskmate_app/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  void _showLogoutConfirmationDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: S.of(context).confirm_exit_registration,
      desc: S.of(context).are_you_sure_you_want_to_logout,
      btnCancelText: S.of(context).cancel,
      btnCancelOnPress: () {},
      btnOkText: S.of(context).logout,
      btnOkColor: Colors.red,
      btnOkOnPress: () {
        Future.delayed(const Duration(seconds: 3)).then((value) {
          GoRouter.of(context).go('/login');
        });
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderHome(),
          const SizedBox(
            height: 40,
          ),
          BuildProfileOptions(
            icon: Icons.person,
            title: S.of(context).update_profile,
            onTap: () {
              GoRouter.of(context).go('/updateProfile');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BuildProfileOptions(
            icon: Icons.lock_outline_rounded,
            title: S.of(context).change_password,
            onTap: () {
              GoRouter.of(context).go('/changePassword');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BuildProfileOptions(
            icon: Icons.settings,
            title: S.of(context).settings,
            onTap: () {
              GoRouter.of(context).go('/settings');
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          BuildProfileOptions(
            icon: Icons.logout,
            title: S.of(context).logout,
            onTap: () {
              _showLogoutConfirmationDialog(context);
              context.read<LoginCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}
