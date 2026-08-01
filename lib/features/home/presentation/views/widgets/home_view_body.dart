import 'package:flutter/material.dart';
import 'package:home_space/features/home/presentation/views/widgets/home_header.dart';

import 'home_main_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeader(),
        SizedBox(height: 30),
        Expanded(child: HomeMainSection()),
      ],
    );
  }
}
