import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_three_dots.dart';

class FavouritesListTileItem extends StatelessWidget {
  const FavouritesListTileItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title, subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: ColorsData.kBorderColor),
        ),
        leading: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: const Color(0xFFE8ECFF) /* Primary-Red-10 */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: SvgPicture.asset(
            Assets.assetsImagesIconsHeartWhiteOutlineIcon,
            colorFilter: ColorFilter.mode(
              ColorsData.kPrimaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(title, style: AppStyles.regular16),
        subtitle: Text(
          subtitle,
          style: AppStyles.regular12.copyWith(
            color: ColorsData.kFontSecondaryColor,
          ),
        ),
        trailing: Transform.rotate(
          angle: math.pi / 2,
          child: const CustomThreeDots(),
        ),
      ),
    );
  }
}
