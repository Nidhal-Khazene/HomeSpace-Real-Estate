import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    super.key,
    required this.socialIcon,
    required this.textContent,
  });
  final String socialIcon;
  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE9E8E8)),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 17.42),
          Image.asset(socialIcon, width: 24, height: 24),
          const SizedBox(width: 54.08),
          Text(textContent, style: AppStyles.medium16),
        ],
      ),
    );
  }
}
