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
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (currentScroll >= (maxScroll - 200) && maxScroll > 0) {
      final cubit = context.read<GetSaleListingsCubit>();
      if (!cubit.isLoading && cubit.hasMoreData) {
        cubit.getSaleListings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<GetSaleListingsCubit>()
            .getSaleListings(isRefresh: true);
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
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
            BlocBuilder<GetSaleListingsCubit, GetSaleListingsState>(
              buildWhen: (previous, current) => current is GetSaleListingsSuccess,
              builder: (context, state) {
                final selectedCategory = state is GetSaleListingsSuccess
                    ? state.selectedCategory
                    : context.read<GetSaleListingsCubit>().currentPropertyType;
                return CategoryChips(
                  selectedCategory: selectedCategory,
                  onTap: (index) {
                    context.read<GetSaleListingsCubit>().filterByCategory(
                          getCategoryTitles()[index],
                        );
                  },
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
