import 'package:flutter/material.dart';
import 'package:home_space/features/home/presentation/views/widgets/sale_listings_list_view.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../shared/widgets/custom_search_bar.dart';
import 'category_chips.dart';

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
          const SaleListingsListView(),
        ],
      ),
    );
  }
}
