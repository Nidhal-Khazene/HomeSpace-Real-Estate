import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_calendar.dart';
import 'package:home_space/features/home/presentation/views/widgets/select_time_choice_chip_list_view.dart';

class ShareListingView extends StatelessWidget {
  const ShareListingView({super.key});

  static const routeName = "ShareListingView";

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
                  title: "Share Listing",
                  widthFromBackButton: 77,
                  textStyle: AppStyles.medium16,
                ),
                const SizedBox(height: 32),
                Text("Select date", style: AppStyles.medium16),
                const SizedBox(height: 16),
                const CustomCalendar(),
                const SizedBox(height: 48),
                Text("Select Time", style: AppStyles.medium16),
                const SizedBox(height: 24),
                const SelectTimeChoiceChipListView(),
                const SizedBox(height: 134),
                const CustomButton(textContent: "Share"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
