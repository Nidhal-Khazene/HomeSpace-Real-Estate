import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({
    super.key,
    this.textContent,
    this.textContentColor,
    required this.backgroundColor,
    required this.borderColor,
    this.widget,
  });

  final String? textContent;
  final Color? textContentColor;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Center(
        child:
            widget ??
            Text(
              textContent!,
              style: AppStyles.medium16.copyWith(color: textContentColor),
            ),
      ),
    );
  }
}
