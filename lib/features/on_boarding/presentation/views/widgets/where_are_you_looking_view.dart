import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

import 'on_boarding_search_bottom_sheet.dart';

class WhereAreYouLookingView extends StatelessWidget {
  const WhereAreYouLookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Where are you looking?", style: AppStyles.medium24),
        const SizedBox(height: 12),
        Text(
          "You can enter cities, neighbourhoods, zip codes and more",
          style: AppStyles.regular12.copyWith(
            color: ColorsData.kFontSecondaryColor,
          ),
        ),
        const SizedBox(height: 46),
        const SearchBottomSheet(),
        const SizedBox(height: 37),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.assetsImagesIconsLocationAddedIcon),
            const SizedBox(width: 8),
            Text(
              "Use Current Location",
              style: AppStyles.regular12.copyWith(
                color: ColorsData.kPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
