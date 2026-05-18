import 'package:flutter/material.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = "/OnBoardingView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnBoardingViewBody()));
  }
}
