import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color progressColor;
  final double progress;
  final Widget icon;
  final TextStyle? textStyle;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.progressColor,
    required this.progress,
    required this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subtitle, style: textStyle),
              icon,
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: textStyle),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(progressColor),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
