import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: Text('Calendar Page', style: TextStyle(fontSize: 24))),
    );
  }
}
