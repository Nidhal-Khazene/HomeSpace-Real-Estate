import 'dart:async';
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
  Timer? _debounce;

  @override
  void initState() {
    if (context.read<GetSaleListingsCubit>().state is GetSaleListingsInitial) {
      context.read<GetSaleListingsCubit>().getSaleListings();
    }
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        final pixels = notification.metrics.pixels;
        final max = notification.metrics.maxScrollExtent;
        // Don't paginate if the content hasn't exceeded the screen size
        if (max == 0) return false;
        
        if (pixels >= max * 0.9) {
          if (_debounce?.isActive ?? false) return false;
          _debounce = Timer(const Duration(milliseconds: 200), () {
            if (mounted) {
              context.read<GetSaleListingsCubit>().getSaleListings();
            }
          });
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
