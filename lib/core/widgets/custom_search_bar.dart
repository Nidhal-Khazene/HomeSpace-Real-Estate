import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.textContent,
    required this.state,
  });

  final String textContent;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: state,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: SvgPicture.asset(Assets.assetsImagesIconsSearchIcon),
        ),
        filled: true,
        fillColor: ColorsData.kNotReadyButtonColor,
        hintText: textContent,
        hintStyle: AppStyles.regular12.copyWith(
          color: ColorsData.kFontSecondaryColor,
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
