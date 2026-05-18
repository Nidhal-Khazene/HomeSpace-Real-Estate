import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/services/shared_preferences_singleton.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class OnBoardingInitialPage extends StatelessWidget {
  const OnBoardingInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage(Assets.assetsImagesOnBoardingImage),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.sizeOf(context).height * .5,
          ),
          const SizedBox(height: 59),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Discover your dream home',
              textAlign: TextAlign.center,
              style: AppStyles.medium32,
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Discover how to navigate our app \'s features and make the most of your real estate journey.',
              textAlign: TextAlign.center,
              style: AppStyles.regular14.copyWith(
                color: const Color(0xFF8C8B8B),
              ),
            ),
          ),
          const SizedBox(height: 48),
          CustomButton(
            onTap: () {
              SharedPreferencesSingleton.setBool(kIsOnBoardingViewSeen, true);
              Navigator.pushReplacementNamed(
                context,
                OnBoardingPageView.routeName,
              );
            },
            textContent: 'Get Started',
            backgroundColor: const Color(0xff4360f6),
          ),
        ],
      ),
    );
  }
}
