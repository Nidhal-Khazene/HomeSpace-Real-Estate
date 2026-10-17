import 'package:flutter/material.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/core/utils/colors.dart';

class CustomScrollContainer extends StatelessWidget {
  const CustomScrollContainer({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: kMillisecondsDuration),
        curve: Curves.easeInOut,
        child: Container(
          width: double.infinity,
          height: 4,
          decoration: ShapeDecoration(
            color: !isActive
                ? ColorsData.kLightPrimaryColor
                : ColorsData.kMediumPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
