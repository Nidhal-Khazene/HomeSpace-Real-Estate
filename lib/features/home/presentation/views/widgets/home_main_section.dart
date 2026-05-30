import 'package:flutter/material.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../shared/widgets/custom_search_bar.dart';
import 'category_chips.dart';
import 'listing_card.dart';

class HomeMainSection extends StatelessWidget {
  const HomeMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchBar(
            textContent: "Search Address, City or Postal code",
            state: true,
          ),
          const SizedBox(height: 32),
          Text("Listings Nearby", style: AppStyles.medium16),
          const SizedBox(height: 16),
          const CategoryChips(),
          const SizedBox(height: 16),
          ListingCard(
            image: Assets.assetsImagesListingBackgroundImage1,
            saleListingsEntity: SaleListingsEntity(
              price: 450,
              formattedAddress:
                  "4517 Washington Ave. Manchester, Kentucky 39495",
              bedrooms: 3,
              agentName: 'John Doe',
              propertyType: 'Condo',
              bathrooms: 2,
              squareFootage: 1200,
              lotSize: 0,
              city: 'Manchester',
            ),
          ),
          const SizedBox(height: 12),
          ListingCard(
            image: Assets.assetsImagesListingBackgroundImage2,
            saleListingsEntity: SaleListingsEntity(
              price: 500,
              formattedAddress: "123 Main St. Austin, Texas 78701",
              bedrooms: 4,
              agentName: 'Jane Smith',
              propertyType: 'Single Family',
              bathrooms: 2,
              squareFootage: 1200,
              lotSize: 0,
              city: 'Austin',
            ),
          ),
        ],
      ),
    );
  }
}
