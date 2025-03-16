import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/core/common/widgets/build_profile_options.dart';
import 'package:taskmate_app/core/common/widgets/header_home.dart';
import 'package:taskmate_app/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const HeaderHome(),
          const SizedBox(height: 40,),
          BuildProfileOptions(icon: Icons.person, title: S.of(context).update_profile, onTap: (){},),
          const SizedBox(height: 20,),
          BuildProfileOptions(icon: Icons.lock_outline_rounded, title: S.of(context).change_password, onTap: (){},),
          const SizedBox(height: 20,),
          BuildProfileOptions(icon: Icons.settings, title: S.of(context).settings, onTap: (){
            GoRouter.of(context).go('/settings');
          },),
           SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          BuildProfileOptions(icon: Icons.logout, title: S.of(context).logout, onTap: (){},),
        ],
      ),
    );
  }
}
