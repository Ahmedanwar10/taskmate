import 'package:flutter/material.dart';
import 'package:taskmate_app/core/app_style.dart';

class InProgressSection extends StatelessWidget {
  InProgressSection(
      {super.key, required this.progressCount, required this.text});
  final String progressCount;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppStyles.styleSomarSansBold20black(context),
            ),
            const SizedBox(width: 25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 221, 244),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(progressCount,
                  style: AppStyles.styleSomarSansBold20(context).copyWith(
                    fontSize: 14,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
