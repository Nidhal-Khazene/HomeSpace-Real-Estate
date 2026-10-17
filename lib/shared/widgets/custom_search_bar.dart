import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:iconly/iconly.dart';

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
        prefixIcon: Icon(IconlyBroken.search, color: ColorsData.kBlackColor),
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
      borderSide: BorderSide(color: ColorsData.kTransparentColor),
    );
  }
}
