import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(padding: kPrimaryScreenPadding, child: HomeViewBody()),
      ),
    );
  }
}
