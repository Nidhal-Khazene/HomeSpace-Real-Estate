import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_oval_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NoListingOnYourWishlistYet extends StatelessWidget {
  const NoListingOnYourWishlistYet({super.key});

  static const routeName = "NoListingOnYourWishlistYet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOvalContainer(
                  borderColor: Colors.transparent,
                  backgroundColor: ColorsData.kLightPrimaryColor,
                  width: 104,
                  height: 104,
                  widget: Icon(
                    Iconsax.heart_search_copy,
                    color: ColorsData.kMediumPrimaryColor,
                    size: 64,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width:
                      MediaQuery.sizeOf(context).width -
                      (59 - kHorizontalPadding * 2),
                  child: Text(
                    'No listing on your wishlist yet',
                    textAlign: TextAlign.center,
                    style: AppStyles.medium24,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderColor: Colors.transparent,
                  backgroundColor: ColorsData.kMediumPrimaryColor,
                  width: 163,
                  textContent: "Explore listing",
                  textStyle: AppStyles.regular12.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
