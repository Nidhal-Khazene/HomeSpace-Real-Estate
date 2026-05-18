import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = "/splashView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.kPrimaryColor,
      body: const SplashViewBody(),
    );
  }
}
