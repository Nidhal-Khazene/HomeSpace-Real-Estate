import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/services/shared_preferences_singleton.dart';
import 'package:home_space/features/auth/presentation/views/login_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:home_space/features/splash/presentation/views/widgets/sliding_logo.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    executeNavigation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingLogo(slidingAnimation: slidingAnimation);
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = SharedPreferencesSingleton.getBool(
      kIsOnBoardingViewSeen,
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (!isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
