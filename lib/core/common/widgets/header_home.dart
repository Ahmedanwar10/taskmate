import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/widgets/avatar_profile.dart';
import 'package:taskmate_app/Features/login/presentation/managers/login_cubit.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.select<LoginCubit, String>((cubit) {
      final state = cubit.state;
      return state is LoginSuccess ? state.username : 'Guest';
    }); // استدعاء اسم المستخدم

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileAvatar(
          // يمكنك تمكين التنقل إلى الملف الشخصي عند الضغط عليه
         // onTap: () => GoRouter.of(context).go('/profile'),
        ),
        const SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Welcome to TaskMate'),
            const SizedBox(height: 4.5),
            Text(username.isNotEmpty ? username : 'Guest', // عرض الاسم أو "Guest" في حال عدم تسجيل الدخول
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
