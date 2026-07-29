import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/features/home/presentation/views/widgets/sale_listings_list_view_bloc_consumer.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../shared/widgets/custom_search_bar.dart';
import 'category_chips.dart';

class HomeMainSection extends StatelessWidget {
  const HomeMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        final pixels = notification.metrics.pixels;
        final max = notification.metrics.maxScrollExtent;
        if (pixels >= max * 0.7) {
          context.read<GetSaleListingsCubit>().getSaleListings();
        }
        return false;
      },
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
            const CategoryChips(),
            const SizedBox(height: 16),
            const SaleListingsListViewBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
