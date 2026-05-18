import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';

import '../utils/styles.dart';

class CustomOvalContainer extends StatelessWidget {
  const CustomOvalContainer({
    super.key,
    this.backgroundColor,
    this.textContent,
    this.textContentColor,
    this.borderColor,
    this.onTap,
    this.widget,
    this.width,
    this.height,
  });
  final Color? backgroundColor;
  final String? textContent;
  final Color? textContentColor;
  final Color? borderColor;
  final void Function()? onTap;
  final Widget? widget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width ?? 100,
        width: height ?? 100,
        decoration: ShapeDecoration(
          color: backgroundColor ?? ColorsData.kMediumPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: borderColor ?? ColorsData.kMediumPrimaryColor,
            ),
          ),
        ),
        child: Center(
          child:
              widget ??
              Text(
                textContent ?? "",
                textAlign: TextAlign.center,
                style: AppStyles.medium16.copyWith(
                  color: textContentColor ?? Colors.white,
                ),
              ),
        ),
      ),
    );
  }
}
