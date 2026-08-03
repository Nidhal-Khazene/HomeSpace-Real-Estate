import 'package:flutter/material.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/shared/functions/get_dummy_listing_images.dart';
import 'package:home_space/shared/functions/get_dummy_sale_listings.dart';
import 'listing_card.dart';

class SaleListingsListView extends StatelessWidget {
  const SaleListingsListView({super.key, this.saleListings});

  final List<SaleListingsEntity>? saleListings;

  @override
  Widget build(BuildContext context) {
    final listings = saleListings ?? getDummySaleListings();
    final listingImages = getDummyListingImages();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: listings.length,
      itemBuilder: (context, index) {
        final listing = listings[index];
        final image = listingImages[index % listingImages.length];
        return ListingCard(image: image, saleListingsEntity: listing);
      },
    );
  }
}
