import 'package:flutter/material.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/shared/functions/get_dummy_sale_listings.dart';
import 'listing_card.dart';

class SaleListingsListView extends StatelessWidget {
  const SaleListingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final dummySaleListings = getDummySaleListings();
    final listingImages = [
      Assets.assetsImagesListingBackgroundImage1,
      Assets.assetsImagesListingBackgroundImage2,
      Assets.assetsImagesListingBackgroundImage1,
      Assets.assetsImagesListingBackgroundImage2,
      Assets.assetsImagesListingBackgroundImage1,
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: dummySaleListings.length,
      itemBuilder: (context, index) {
        final listing = dummySaleListings[index];
        final image = listingImages[index % listingImages.length];
        return ListingCard(image: image, saleListingsEntity: listing);
      },
    );
  }
}
