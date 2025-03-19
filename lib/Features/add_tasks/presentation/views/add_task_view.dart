import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/add_tasks/presentation/views/widget/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/bottomNavBar');
          },
        ),
      ),
      body: AddTaskViewBody(),
    );
  }
}