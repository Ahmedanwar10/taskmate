import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/add_tasks/data/repo/add_task_repo_impl.dart';
import 'package:taskmate_app/Features/add_tasks/data/service/add_task_api_service.dart';
import 'package:taskmate_app/Features/add_tasks/presentation/managers/add_task_cubit_cubit.dart';
import 'package:taskmate_app/Features/add_tasks/presentation/views/widget/add_task_view_body.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

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
      body: BlocProvider(
        create: (context) => AddTaskCubitCubit(
          AddTaskRepoImpl(addTaskApiService: AddTaskApiService(DioWrapper())),
        ),
        child: AddTaskViewBody(),
      ),
    );
  }
}
