import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/home/widgets/inprogress_section.dart';
import 'package:taskmate_app/Features/home/widgets/prograss_card.dart';
import 'package:taskmate_app/Features/home/widgets/task_card_model.dart';
import 'package:taskmate_app/Features/home/widgets/task_group_item.dart';
import 'package:taskmate_app/Features/profile/views/widgets/avatar_profile.dart';
import 'package:taskmate_app/core/constants/assets.dart';
import 'package:taskmate_app/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildHeader(context),
                const SizedBox(height: 40),
                ProgressCard(onTap: () {}, progress: 0.8),
                const SizedBox(height: 20),
                InProgressSection(
                    progressCount: '6', text: S.of(context).in_progress),
                const SizedBox(height: 20),
                const TaskCardList(), // 🔥 استبدال التكرار بالمكون الجديد
                const SizedBox(height: 20),
                InProgressSection(
                    progressCount: '6', text: S.of(context).tasks_group),
                const SizedBox(height: 20),
                _buildTaskGroup(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(
          imagePath: Assets.imagesIMG20240225174536993,
          onTap: () => GoRouter.of(context).go('/profile'),
        ),
        const SizedBox(width: 13),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Welcome to TaskMate'),
            SizedBox(height: 4.5),
            Text('Ahmed Anwar'),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.notifications_sharp, color: Colors.black),
          onPressed: () => GoRouter.of(context).go('/notification'),
        ),
      ],
    );
  }

  Widget _buildTaskGroup(BuildContext context) {
    return TaskGroupItem(
      title: S.of(context).office_projects,
      taskCount: '32 Tasks',
      progress: 8,
      progressColor: const Color(0xFF5A2ECC),
      icon: SvgPicture.asset(Assets.imagesIconWork),
      iconBackground: const Color.fromARGB(255, 216, 140, 198),
    );
  }
}

class TaskCardList extends StatelessWidget {
  const TaskCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(2, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TaskCard(
              title: S.of(context).office_projects,
              subtitle: S.of(context).grocery_shopping_app_design,
              backgroundColor: const Color.fromARGB(255, 216, 140, 198),
              progressColor: const Color(0xFF5A2ECC),
              progress: 0.8,
              icon: SvgPicture.asset(Assets.imagesIconWork2),
            ),
          );
        }),
      ),
    );
  }
}
