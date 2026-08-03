import 'package:flutter/material.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_carousel_view.dart';
import 'package:home_space/shared/functions/get_dummy_listing_card_details_images.dart';

import 'Listing_card_properties_row.dart';
import 'listing_card_details_app_bar.dart';
import 'listing_card_details_custom_bottom_bar.dart';
import 'listing_card_details_personal_list_tile.dart';

class ListingCardDetailsView extends StatelessWidget {
  const ListingCardDetailsView({super.key, required this.saleListingsEntity});

  static const String routeName = "ListingCardDetailsView";
  final SaleListingsEntity saleListingsEntity;

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
                ListingCardDetailsCarouselView(
                  images: getDummyListingCardDetailsImages(),
                ),
                const SizedBox(height: 24),
                Text(
                  "\$${saleListingsEntity.price.toString()}",
                  style: AppStyles.medium12.copyWith(
                    color: ColorsData.kMediumPrimaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  saleListingsEntity.formattedAddress,
                  style: AppStyles.medium16,
                ),
                const SizedBox(height: 16),
                ListingCardPropertiesRow(
                  saleListingsEntity: saleListingsEntity,
                ),
                const SizedBox(height: 24),
                ListingCardDetailsPersonalListTile(
                  saleListingsEntity: saleListingsEntity,
                ),
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
