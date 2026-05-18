import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class HomeHeaderLocationBar extends StatelessWidget {
  const HomeHeaderLocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 44,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: ColorsData.kBorderColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsImagesIconsLocationIcon),
              const Expanded(child: SizedBox(width: 8)),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: 81,
                  child: Text(
                    "Washington Dc",
                    style: AppStyles.regular12,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              const Expanded(child: SizedBox(width: 8)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(Assets.assetsImagesIconsArrowDown),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
