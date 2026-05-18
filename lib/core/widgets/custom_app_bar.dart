import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_go_back_button.dart';

import 'custom_circle_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.textStyle,
    this.widthFromBackButton,
    this.profileImageWidget,
  });

  final String title;
  final TextStyle? textStyle;
  final double? widthFromBackButton;
  final Widget? profileImageWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomGoBackButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Row(
          children: [
            Visibility(
              visible: profileImageWidget != null,
              child: CustomCircleContainer(
                backgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                widget: profileImageWidget,
              ),
            ),
            const SizedBox(width: 10),
            Text(title, style: textStyle ?? AppStyles.medium16),
          ],
        ),
        Flexible(
          child: SizedBox(
            width:
                (MediaQuery.sizeOf(context).width / 4) - kHorizontalPadding * 2,
          ),
        ),
      ],
    );
  }
}
