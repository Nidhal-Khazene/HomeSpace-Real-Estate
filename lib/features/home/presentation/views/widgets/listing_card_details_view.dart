import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_carousel_view.dart';

import '../../../../../core/utils/assets.dart';
import 'Listing_card_properties_row.dart';
import 'listing_card_details_app_bar.dart';
import 'listing_card_details_custom_bottom_bar.dart';
import 'listing_card_details_personal_list_tile.dart';

class ListingCardDetailsView extends StatelessWidget {
  const ListingCardDetailsView({super.key});

  static const String routeName = "ListingCardDetailsView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ListingCardDetailsCustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListingCardDetailsAppBar(),
                const SizedBox(height: 32),
                const ListingCardDetailsCarouselView(
                  image: Assets.assetsImagesListingCardDetails,
                ),
                const SizedBox(height: 24),
                Text(
                  r"$450/Week",
                  style: AppStyles.medium12.copyWith(
                    color: ColorsData.kMediumPrimaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "4519 Washington Ave. Manchester, Kentucky 39494",
                  style: AppStyles.medium16,
                ),
                const SizedBox(height: 16),
                const ListingCardPropertiesRow(),
                const SizedBox(height: 24),
                const ListingCardDetailsPersonalListTile(),
                const SizedBox(height: 24),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'That\'s it! You\'re now ready to dive into the world of real estate with our app. Enjoy exploring properties, finding your dream home, and making informed decisions.',
                        style: TextStyle(
                          color: Color(0xFF8C8B8B),
                          fontSize: 12,
                          fontFamily: 'GT Walsheim Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Read More',
                        style: TextStyle(
                          color: Color(0xFF4360F6) /* Primary-Red-100 */,
                          fontSize: 12,
                          fontFamily: 'GT Walsheim Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 62),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
