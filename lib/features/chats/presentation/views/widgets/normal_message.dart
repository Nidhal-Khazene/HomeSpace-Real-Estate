import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class NormalMessage extends StatelessWidget {
  const NormalMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Container(
        width: 240,
        decoration: ShapeDecoration(
          color: ColorsData.kMediumPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(
              width: 224,
              child: Text(
                "I will send you more listings for you to check out..how about that ?",
                style: AppStyles.regular12.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
