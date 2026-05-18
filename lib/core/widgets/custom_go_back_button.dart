import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_space/core/utils/assets.dart';

import '../utils/colors.dart';

class CustomGoBackButton extends StatelessWidget {
  const CustomGoBackButton({
    super.key,
    required this.onTap,
    this.widget,
    this.borderColor,
  });
  final void Function() onTap;
  final Widget? widget;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(color: borderColor ?? const Color(0xFFE9E8E8)),
          ),
        ),
        height: 40,
        width: 40,
        child: Center(
          child:
              widget ??
              SvgPicture.asset(
                Assets.assetsImagesIconsArrowBack,
                colorFilter: ColorFilter.mode(
                  ColorsData.kFontPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
        ),
      ),
    );
  }
}
