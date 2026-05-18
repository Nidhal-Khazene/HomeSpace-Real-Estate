import 'package:flutter/material.dart';

class BottomSheetLineHeader extends StatelessWidget {
  const BottomSheetLineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 4,
      decoration: ShapeDecoration(
        color: const Color(0xFFE8ECFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      ),
    );
  }
}
