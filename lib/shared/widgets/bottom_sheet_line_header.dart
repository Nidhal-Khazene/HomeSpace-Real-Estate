import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';

class BottomSheetLineHeader extends StatelessWidget {
  const BottomSheetLineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 4,
      decoration: ShapeDecoration(
        color: ColorsData.kLightPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      ),
    );
  }
}
