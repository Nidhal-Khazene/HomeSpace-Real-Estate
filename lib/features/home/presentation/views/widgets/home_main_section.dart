import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/features/home/presentation/views/widgets/sale_listings_list_view_bloc_consumer.dart';
import 'package:home_space/shared/functions/get_category_titles.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../shared/widgets/custom_search_bar.dart';
import 'category_chips.dart';

class HomeMainSection extends StatefulWidget {
  const HomeMainSection({super.key});

  @override
  State<HomeMainSection> createState() => _HomeMainSectionState();
}

class _HomeMainSectionState extends State<HomeMainSection> {
  // Prevents re-firing getSaleListings() on every scroll tick while the
  // user is dragging within the last 10% of the list. Resets once they
  // scroll back away from the threshold, so it can trigger again later.
  bool _paginationTriggered = false;

  bool _handleScrollNotification(ScrollUpdateNotification notification) {
    // Only listen to the main vertical scroll view, not nested horizontal ones like CategoryChips
    if (notification.depth != 0) return false;

    final pixels = notification.metrics.pixels;
    final max = notification.metrics.maxScrollExtent;

    // Don't paginate if the content hasn't exceeded the screen size
    if (max == 0) return false;

    final isNearBottom = pixels >= max * 0.9;

    if (isNearBottom && !_paginationTriggered) {
      _paginationTriggered = true;
      context.read<GetSaleListingsCubit>().getSaleListings();
    } else if (!isNearBottom) {
      _paginationTriggered = false;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _handleScrollNotification,
      child: SingleChildScrollView(
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
            CategoryChips(
              onTap: (index) {
                context.read<GetSaleListingsCubit>().filterByCategory(
                  getCategoryTitles()[index],
                );
              },
            ),
            const SizedBox(height: 16),
            const SaleListingsListViewBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
