import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_go_back_button.dart';

import 'custom_scroll_container.dart';

class OnBoardingPageViewHeader extends StatelessWidget {
  const OnBoardingPageViewHeader({
    super.key,
    required this.currentPage,
    required this.backPressed,
  });

  final int currentPage;
  final VoidCallback backPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentPage == 0
                ? const SizedBox()
                : CustomGoBackButton(
                    onTap: () {
                      backPressed();
                    },
                  ),
            Text("${currentPage + 1}/5", style: AppStyles.regular12),
            currentPage == 0 ? const SizedBox() : const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          spacing: 5,
          children: List.generate(5, (index) {
            bool isActive = index <= currentPage;
            return CustomScrollContainer(
              key: ValueKey(index),
              isActive: isActive, // Important for list operations
              // Add additional properties if needed:
              // width: constraints.maxWidth * 0.18,
              // margin: EdgeInsets.symmetric(horizontal: 2),
            );
          }),
        ),
      ],
    );
  }
}
