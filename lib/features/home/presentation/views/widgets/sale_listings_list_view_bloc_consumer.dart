import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/shared/functions/get_dummy_sale_listings.dart';
import 'package:home_space/shared/widgets/custom_no_data_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'sale_listings_list_view.dart';

class SaleListingsListViewBlocConsumer extends StatefulWidget {
  const SaleListingsListViewBlocConsumer({super.key});

  @override
  State<SaleListingsListViewBlocConsumer> createState() =>
      _SaleListingsListViewBlocConsumerState();
}

class _SaleListingsListViewBlocConsumerState
    extends State<SaleListingsListViewBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSaleListingsCubit, GetSaleListingsState>(
      buildWhen: (previous, current) {
        return current is GetSaleListingsLoading ||
            current is GetSaleListingsSuccess ||
            current is GetSaleListingsFailure ||
            current is GetSaleListingsFilterLoading ||
            current is GetSaleListingsFilterSuccess ||
            current is GetSaleListingsFilterFailure;
      },
      listener: (context, state) {
        if (state is GetSaleListingsPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        } else if (state is GetSaleListingsFilterFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          // Keying on the state's runtime type (not the whole state, which
          // may not be Equatable-stable) makes AnimatedSwitcher treat each
          // state kind as a distinct widget subtree and cross-fade between
          // them, instead of relying on a manually inserted delay.
          child: KeyedSubtree(
            key: ValueKey(state.runtimeType),
            child: _buildContent(state),
          ),
        );
      },
    );
  }

  Widget _buildContent(GetSaleListingsState state) {
    if (state is GetSaleListingsLoading) {
      return Skeletonizer(
        child: SaleListingsListView(saleListings: getDummySaleListings()),
      );
    } else if (state is GetSaleListingsFilterLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is GetSaleListingsSuccess) {
      if (state.listings.isEmpty) {
        return const CustomNoDataView();
      }
      return SaleListingsListView(saleListings: state.listings);
    } else if (state is GetSaleListingsFilterSuccess) {
      if (state.listings.isEmpty) {
        return const CustomNoDataView();
      }
      return SaleListingsListView(saleListings: state.listings);
    } else {
      return const CustomNoDataView();
    }
  }
}
