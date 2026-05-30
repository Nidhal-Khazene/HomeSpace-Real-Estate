import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/styles.dart';

void showSuccessSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.white,
      content: Row(
        children: [
          SvgPicture.asset(Assets.assetsImagesTrueCircleContainer),
          const SizedBox(width: 12),
          Text(
            message,
            style: AppStyles.regular12.copyWith(
              color: ColorsData.kFontPrimaryColor,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: kHorizontalPadding,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: const Duration(seconds: 3),
    ),
  );
}
