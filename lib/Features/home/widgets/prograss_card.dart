import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';

class ProgressCard extends StatelessWidget {
  final double progress;
  final VoidCallback onTap;

  const ProgressCard({
    super.key,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.purple, // لون الخلفية البنفسجي
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // النص والزر
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).your_task_almost_done,
                  style: AppStyles.styleSomarSansMedium14(context),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  color: Colors.white,
                  text: S.of(context).view_task,
                  textStyle: AppStyles.styleSomarSansSemiBold26(context)
                      .copyWith(fontSize: 20),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
          const CircularWidgets(progress: 0.8), // جرب تثبيت القيمة للاختبار
          const SizedBox(width: 10),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularWidgets extends StatelessWidget {
  const CircularWidgets({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 40.0,
      lineWidth: 8.0,
      percent: progress,
      center: Text(
        "${(progress * 100).toInt()}%",
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      progressColor: Colors.white,
      backgroundColor: Colors.purple.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
