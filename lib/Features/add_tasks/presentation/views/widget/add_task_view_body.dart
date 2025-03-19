import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            onPressed: () {
              final taskData = {
                "title": titleController.text,
                "description": descriptionController.text,
                "date": "11/03/2025", // يمكن تغييره ليكون ديناميكياً
                "time": "05:00 PM",
              };
              GoRouter.of(context).go('/home', extra: taskData); // يمكن تغييره ليكون ديناميكياً(taskData);
            },
          ),
        ],
      ),
    );
  }
}
