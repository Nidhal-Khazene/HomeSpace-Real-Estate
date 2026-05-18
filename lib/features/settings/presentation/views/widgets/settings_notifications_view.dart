import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/models/list_tile_model.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/toggle_container_switch.dart';

class SettingsNotificationsView extends StatelessWidget {
  const SettingsNotificationsView({super.key});

  static const routeName = "SettingsNotificationsView";
  static final List<ListTileModel> saleList = [
    ListTileModel(
      title: "Get Recommendation on Sale Suggested Searches ",
      subtitle:
          "Receive Information about new listing based on your search history.",
    ),
    ListTileModel(
      title: "For Saved Sale listing Updates",
      subtitle:
          "We will notify you when your saved listing has a status Change",
    ),
  ];
  static final List<ListTileModel> rentList = [
    ListTileModel(
      title: "Get Recommendation on Rent Suggested Searches ",
      subtitle:
          "Receive Information about new listing based on your search history.",
    ),
    ListTileModel(
      title: "For Saved Rent listing Updates",
      subtitle:
          "We will notify you when your saved listing has a status Change",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: "Notifications", textStyle: AppStyles.bold16),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      textContent: "Push",
                      textStyle: AppStyles.regular12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      textContent: "Email",
                      textStyle: AppStyles.regular12.copyWith(
                        color: ColorsData.kMediumPrimaryColor,
                      ),
                      backgroundColor: Colors.transparent,
                      borderColor: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Sale Alert',
                style: AppStyles.medium16.copyWith(
                  color: ColorsData.kFontSecondaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                spacing: 16,
                children: List.generate(
                  saleList.length,
                  (index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      saleList[index].title!,
                      style: AppStyles.medium12,
                    ),
                    subtitle: Text(
                      saleList[index].subtitle!,
                      style: AppStyles.regular12.copyWith(
                        color: ColorsData.kFontSecondaryColor,
                      ),
                    ),
                    trailing: const ToggleContainerSwitch(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Rent Alert',
                style: AppStyles.medium16.copyWith(
                  color: ColorsData.kFontSecondaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                spacing: 16,
                children: List.generate(
                  rentList.length,
                  (index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      rentList[index].title!,
                      style: AppStyles.medium12,
                    ),
                    subtitle: Text(
                      rentList[index].subtitle!,
                      style: AppStyles.regular12.copyWith(
                        color: ColorsData.kFontSecondaryColor,
                      ),
                    ),
                    trailing: const ToggleContainerSwitch(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
