import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/shared/widgets/custom_button.dart';
import 'package:home_space/shared/widgets/custom_oval_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NoMessageYetInYourInboxView extends StatelessWidget {
  const NoMessageYetInYourInboxView({super.key});
  static const String routeName = "no_message_yet_in_your_inbox_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOvalContainer(
              width: 104,
              height: 104,
              backgroundColor: const Color(0xFFE8ECFF),
              borderColor: Colors.transparent,
              widget: Icon(
                Iconsax.message_search_copy,
                color: ColorsData.kPrimaryColor,
                size: 64,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 250,
              child: Text(
                'No Message yet on your inbox',
                textAlign: TextAlign.center,
                style: AppStyles.medium24,
              ),
            ),
            const SizedBox(height: 20),
            const CustomButton(width: 163, textContent: "Explore Listing"),
          ],
        ),
      ),
    );
  }
}
