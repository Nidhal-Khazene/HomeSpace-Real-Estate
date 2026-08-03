import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/features/home/presentation/views/widgets/home_header.dart';

import 'home_main_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    if (context.read<GetSaleListingsCubit>().state is GetSaleListingsInitial) {
      context.read<GetSaleListingsCubit>().getSaleListings();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeader(),
        SizedBox(height: 30),
        Expanded(child: HomeMainSection()),
      ],
    );
  }
}
