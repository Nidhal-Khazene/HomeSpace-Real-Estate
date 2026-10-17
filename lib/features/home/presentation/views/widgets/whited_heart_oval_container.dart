import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';

class WhitedHeartOvalContainer extends StatelessWidget {
  const WhitedHeartOvalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: ShapeDecoration(
        color: ColorsData.kWhiteOverlayColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Center(
        child: SvgPicture.asset(Assets.assetsImagesIconsHeartWhiteOutlineIcon),
      ),
    );
  }
}
