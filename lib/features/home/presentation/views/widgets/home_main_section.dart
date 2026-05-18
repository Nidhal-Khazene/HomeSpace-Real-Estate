import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_search_bar.dart';
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
          const ListingCard(image: Assets.assetsImagesListingBackgroundImage1),
          const SizedBox(height: 12),
          const ListingCard(image: Assets.assetsImagesListingBackgroundImage2),
        ],
      ),
    );
  }
}
