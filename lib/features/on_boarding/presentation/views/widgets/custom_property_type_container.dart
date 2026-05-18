import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomPropertyTypeContainer extends StatelessWidget {
  const CustomPropertyTypeContainer({
    super.key,
    required this.textContent,
    required this.backgroundColor,
    required this.textContentColor,
    this.borderColor,
  });

  final String textContent;
  final Color textContentColor;
  final Color backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: borderColor ?? const Color(0xFFE9E8E8)),
        ),
        color: backgroundColor,
      ),
      child: Text(
        textContent,
        style: AppStyles.regular12.copyWith(color: textContentColor),
      ),
    );
  }
}
