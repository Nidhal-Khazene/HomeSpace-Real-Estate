import 'package:flutter/material.dart';
import 'package:home_space/core/models/list_tile_model.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/settings/presentation/views/widgets/contact_support_view.dart';
import 'package:home_space/features/settings/presentation/views/widgets/edit_profile.dart';
import 'package:home_space/features/settings/presentation/views/widgets/help_center.dart';
import 'package:home_space/features/settings/presentation/views/widgets/mortgage_calculator_form.dart';
import 'package:home_space/features/settings/presentation/views/widgets/settings_notifications_view.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/functions/build_list_tile_border.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  static List<ListTileModel> list = [
    ListTileModel(
      title: "Edit Profile",
      leadingWidget: Icon(
        Iconsax.user_square_copy,
        color: ColorsData.kMediumPrimaryColor,
        size: 20,
      ),
    ),
    ListTileModel(
      title: "Mortgage Calculator",
      leadingWidget: Icon(
        Iconsax.calculator_copy,
        color: ColorsData.kMediumPrimaryColor,
        size: 20,
      ),
    ),
    ListTileModel(
      title: "Notifications",
      leadingWidget: Icon(
        Iconsax.notification_copy,
        color: ColorsData.kMediumPrimaryColor,
        size: 20,
      ),
    ),
    ListTileModel(
      title: "Help Center",
      leadingWidget: Icon(
        Iconsax.message_question_copy,
        color: ColorsData.kMediumPrimaryColor,
        size: 20,
      ),
    ),
    ListTileModel(
      title: "Contact Support",
      leadingWidget: Icon(
        Iconsax.support_copy,
        color: ColorsData.kMediumPrimaryColor,
        size: 20,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text("Settings", style: AppStyles.medium16),
        const SizedBox(height: 24),
        Column(
          children: List.generate(
            list.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  }
                  if (index == 1) {
                    Navigator.pushNamed(
                      context,
                      MortgageCalculatorForm.routeName,
                    );
                  }
                  if (index == 2) {
                    Navigator.pushNamed(
                      context,
                      SettingsNotificationsView.routeName,
                    );
                  }
                  if (index == 3) {
                    Navigator.pushNamed(context, HelpCenter.routeName);
                  }
                  if (index == 4) {
                    Navigator.pushNamed(context, ContactSupportView.routeName);
                  }
                },
                child: ListTile(
                  shape: buildListTileRoundedRectangleBorder(),
                  leading: CircleAvatar(
                    backgroundColor: ColorsData.kLightPrimaryColor,
                    child: list[index].leadingWidget,
                  ),
                  title: Text(list[index].title!, style: AppStyles.regular14),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
