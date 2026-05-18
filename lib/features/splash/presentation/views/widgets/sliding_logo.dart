import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) => SlideTransition(
        position: slidingAnimation,
        child: Center(child: Image.asset(Assets.assetsImagesSplashLogo)),
      ),
    );
  }
}
