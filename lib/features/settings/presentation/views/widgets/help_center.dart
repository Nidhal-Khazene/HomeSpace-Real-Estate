import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/features/settings/presentation/views/widgets/custom_asked_question.dart';

import '../../../../../core/widgets/custom_search_bar.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  static const routeName = "HelpCenter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: "Help Center",
                  textStyle: AppStyles.medium16,
                ),
                const SizedBox(height: 16),
                const CustomSearchBar(textContent: "Search", state: true),
                const SizedBox(height: 40),
                Text("Frequently Asked Questions", style: AppStyles.medium16),
                const SizedBox(height: 16),
                const CustomAskedQuestion(
                  title: "Can Homespace sell my property",
                  subtitle:
                      "Yes, Homespace can definitely help you sell your property. They have a strong network and marketing strategies to attract potential buyers. Their agents will assist you with pricing, staging, marketing, and negotiations to ensure a smooth and successful sale.",
                ),
                const SizedBox(height: 12),
                const CustomAskedQuestion(
                  title: "How does Homespace determine property prices ?",
                  subtitle:
                      "Yes, Homespace can definitely help you sell your property. They have a strong network and marketing strategies to attract potential buyers. Their agents will assist you with pricing, staging, marketing, and negotiations to ensure a smooth and successful sale.",
                ),
                const SizedBox(height: 12),
                const CustomAskedQuestion(
                  title: "Can i get a mortgage through Homespace?",
                  subtitle:
                      "Yes, Homespace can definitely help you sell your property. They have a strong network and marketing strategies to attract potential buyers. Their agents will assist you with pricing, staging, marketing, and negotiations to ensure a smooth and successful sale.",
                ),
                const SizedBox(height: 12),
                const CustomAskedQuestion(
                  title: "How can Homespace help me buy a home ?",
                  subtitle:
                      "Yes, Homespace can definitely help you sell your property. They have a strong network and marketing strategies to attract potential buyers. Their agents will assist you with pricing, staging, marketing, and negotiations to ensure a smooth and successful sale.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
