import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate_app/Features/home/all_tasks/presentation/managers/all_tasks_cubit.dart';
import 'package:taskmate_app/Features/home/widgets/prograss_card.dart';
import 'package:taskmate_app/Features/home/widgets/task_card_model.dart';
import 'package:taskmate_app/core/common/widgets/header_home.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(() => context.read<AllTasksCubit>().fetchAllTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const HeaderHome(),
            const SizedBox(height: 40),
            ProgressCard(onTap: () {}, progress: 0.8),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<AllTasksCubit, AllTasksState>(
                builder: (context, state) {
                  if (state is AllTasksLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AllTasksError) {
                    return Center(child: Text("⚠️ ${state.errorMessage}"));
                  } else if (state is AllTasksLoaded) {
                    if (state.modelAll.tasks == null || state.modelAll.tasks!.isEmpty) {
                      return const Center(child: Text("لا توجد مهام متاحة 📌"));
                    }
                    return ListView.builder(
                      itemCount: state.modelAll.tasks!.length,
                      itemBuilder: (context, index) {
                        final task = state.modelAll.tasks![index];
                        return TaskCard(
                          title: task.title ?? "بدون عنوان",
                          description: task.description ?? "بدون وصف",
                          date: task.createdAt ?? "تاريخ غير متاح",
                          time: "وقت غير متاح",
                        );
                      },
                    );
                  }
                  return const Center(child: Text("ابدأ بإضافة مهامك 📌"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
