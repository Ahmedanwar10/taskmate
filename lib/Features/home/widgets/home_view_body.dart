import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/home/widgets/prograss_card.dart';
import 'package:taskmate_app/Features/home/widgets/task_card_model.dart';
import 'package:taskmate_app/core/common/widgets/header_home.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Map<String, String>> tasks = [
    {
      "title": "My First Task",
      "description": "Improve my English skills by trying to speak",
      "date": "11/03/2025",
      "time": "05:00 PM"
    }
  ];

  void _addTask(String title, String description, String date, String time) {
    setState(() {
      tasks.add({
        "title": title,
        "description": description,
        "date": date,
        "time": time,
      });
    });
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
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    title: tasks[index]['title']!,
                    description: tasks[index]['description']!,
                    date: tasks[index]['date']!,
                    time: tasks[index]['time']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      

    );
  }
}
