import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class WhitedHeartOvalContainer extends StatelessWidget {
  const WhitedHeartOvalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Center(
        child: SvgPicture.asset(Assets.assetsImagesIconsHeartWhiteOutlineIcon),
      ),
    );
  }
}
