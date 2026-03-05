import 'package:flutter/material.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/want_latest_listing_sent_directly_to_you_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/what_are_you_looking_for_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/what_is_your_building_preference_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/what_is_your_price_range_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/where_are_you_looking_view.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          WhatAreYouLookingForView(),
          WhereAreYouLookingView(),
          WhatIsYourPriceRange(),
          WhatIsYourBuildingPreferenceView(),
          WantLatestListingSentDirectlyToYou(),
        ],
      ),
    );
  }
}
