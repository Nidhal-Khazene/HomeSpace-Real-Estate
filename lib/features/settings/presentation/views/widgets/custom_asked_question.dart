import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomAskedQuestion extends StatefulWidget {
  const CustomAskedQuestion({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  State<CustomAskedQuestion> createState() => _CustomAskedQuestionState();
}

class _CustomAskedQuestionState extends State<CustomAskedQuestion> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsData.kBorderColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: AppStyles.regular12),
                Transform.rotate(
                  angle: -math.pi / 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Text(widget.subtitle, style: AppStyles.regular12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
