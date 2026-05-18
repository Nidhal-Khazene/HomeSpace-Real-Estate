import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomPriceField extends StatelessWidget {
  const CustomPriceField({super.key, required this.textContent});
  final String textContent;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: textContent,
        hintStyle: AppStyles.regular16.copyWith(
          color: ColorsData.kFontSecondaryColor,
        ),
        enabledBorder: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFE9E8E8), width: 1),
    );
  }
}
