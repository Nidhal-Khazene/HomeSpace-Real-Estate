import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/shared/functions/get_dummy_sale_listings.dart';
import 'package:home_space/shared/functions/show_failure_snack_bar.dart';
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
  List<SaleListingsEntity> saleListings = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSaleListingsCubit, GetSaleListingsState>(
      builder: (context, state) {
        if (state is GetSaleListingsSuccess ||
            state is GetSaleListingsPaginationLoading ||
            state is GetSaleListingsPaginationFailure) {
          return SaleListingsListView(saleListings: saleListings);
        } else if (state is GetSaleListingsFailure) {
          return const CustomNoDataView();
        } else {
          return Skeletonizer(
            child: SaleListingsListView(saleListings: getDummySaleListings()),
          );
        }
      },
      listener: (context, state) {
        if (state is GetSaleListingsSuccess) {
          saleListings = state.listings;
        }

        if (state is GetSaleListingsPaginationFailure) {
          showFailureSnackBar(context, message: state.errMessage);
        }
      },
    );
  }
}
