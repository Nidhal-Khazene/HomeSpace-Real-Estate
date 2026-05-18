import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class WantLatestListingSentDirectlyToYou extends StatelessWidget {
  const WantLatestListingSentDirectlyToYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Want latest listing sent directly to you",
          style: AppStyles.medium24,
        ),
        const SizedBox(height: 12),
        Text(
          "We will send you home that match what you are looking for ?",
          style: AppStyles.regular12.copyWith(
            color: ColorsData.kFontSecondaryColor,
          ),
        ),
      ],
    );
  }
}
