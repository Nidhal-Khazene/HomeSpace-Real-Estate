import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/Features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';

class SaleListingsListViewBlocConsumer extends StatelessWidget {
  const SaleListingsListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSaleListingsCubit, GetSaleListingsState>(
      builder: builder,
      listener: listener,
    );
  }
}
