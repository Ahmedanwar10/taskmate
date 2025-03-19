import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/add_tasks/presentation/managers/add_task_cubit_cubit.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  _AddTaskViewBodyState createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubitCubit, AddTaskCubitState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'Success',
            desc: 'Task added successfully!',
            btnOkOnPress: () {
              titleController.clear();
              descriptionController.clear();
              GoRouter.of(context).go('/home');
            },
          ).show();
        } else if (state is AddTaskFailure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: state.errorMessage,
            btnOkOnPress: () {},
          ).show();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextFormField(
                hint: 'Task Title',
                controller: titleController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Task Description',
                controller: descriptionController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Add Task',
                onPressed: state is AddTaskLoading
                    ? () {}
                    : () {
                        if (titleController.text.isEmpty ||
                            descriptionController.text.isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: 'Warning',
                            desc: 'Please fill all fields!',
                            btnOkOnPress: () {},
                          ).show();
                          return;
                        }

                        context.read<AddTaskCubitCubit>().addTask(
                              titleController.text,
                              descriptionController.text,
                            );
                      },
              ),
            ],
          ),
        );
      },
    );
  }
}
