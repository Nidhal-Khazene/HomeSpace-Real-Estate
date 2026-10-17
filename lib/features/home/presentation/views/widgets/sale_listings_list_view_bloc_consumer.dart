import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/shared/functions/get_dummy_sale_listings.dart';
import 'package:home_space/shared/widgets/custom_no_data_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'sale_listings_list_view.dart';

class SaleListingsListViewBlocConsumer extends StatelessWidget {
  const SaleListingsListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSaleListingsCubit, GetSaleListingsState>(
      listenWhen: (previous, current) =>
          current is GetSaleListingsPaginationFailure,
      listener: (context, state) {
        if (state is GetSaleListingsPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      buildWhen: (previous, current) {
        return current is GetSaleListingsLoading ||
            current is GetSaleListingsSuccess ||
            current is GetSaleListingsFailure;
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: KeyedSubtree(
            key: ValueKey(state.runtimeType),
            child: _buildContent(context, state),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, GetSaleListingsState state) {
    if (state is GetSaleListingsLoading) {
      return Skeletonizer(
        child: SaleListingsListView(saleListings: getDummySaleListings()),
      );
    } else if (state is GetSaleListingsFailure) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.errMessage,
                style: AppStyles.regular12,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  context.read<GetSaleListingsCubit>().getSaleListings();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorsData.kMediumPrimaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Retry',
                  style: AppStyles.regular12.copyWith(
                    color: ColorsData.kMediumPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (state is GetSaleListingsSuccess) {
      if (state.listings.isEmpty) {
        return const CustomNoDataView();
      }
      return Column(
        children: [
          SaleListingsListView(saleListings: state.listings),
          if (state.isPaginationLoading)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: ColorsData.kMediumPrimaryColor,
                  ),
                ),
              ),
            ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
