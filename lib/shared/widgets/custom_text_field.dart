import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textContent,
    this.textContentColor,
    this.onChanged,
    this.maxLines,
    this.textInputType,
    this.borderRadiusValue,
    this.hintStyle,
    this.contentPadding,
  });
  final String textContent;
  final Color? textContentColor;
  final void Function(String?)? onChanged;
  final int? maxLines;
  final TextInputType? textInputType;
  final double? borderRadiusValue;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: textContent,
        hintStyle:
            hintStyle ??
            AppStyles.regular16.copyWith(
              color: textContentColor ?? ColorsData.kFontSecondaryColor,
            ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 4),
      borderSide: BorderSide(width: 1, color: ColorsData.kBorderColor),
    );
  }
}
