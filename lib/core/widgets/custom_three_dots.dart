import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';

class CustomThreeDots extends StatelessWidget {
  const CustomThreeDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: ShapeDecoration(
            color: ColorsData.kFontPrimaryColor,
            shape: const OvalBorder(),
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: ShapeDecoration(
            color: ColorsData.kFontPrimaryColor,
            shape: const OvalBorder(),
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: ShapeDecoration(
            color: ColorsData.kFontPrimaryColor,
            shape: const OvalBorder(),
          ),
        ),
      ],
    );
  }
}
