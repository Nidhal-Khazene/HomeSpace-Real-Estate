import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    required this.textContent,
    this.textContentColor,
    this.borderColor,
    this.onTap,
    this.width,
    this.height,
    this.verticalPadding,
    this.textStyle,
  });
  final Color? backgroundColor;
  final String textContent;
  final Color? textContentColor;
  final Color? borderColor;
  final void Function()? onTap;
  final double? width, height;
  final double? verticalPadding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 16),
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? ColorsData.kPrimaryColor),
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? ColorsData.kMediumPrimaryColor,
        ),
        child: Center(
          child: Text(
            textContent,
            textAlign: TextAlign.center,
            style:
                textStyle ??
                AppStyles.regular16.copyWith(
                  color: textContentColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
