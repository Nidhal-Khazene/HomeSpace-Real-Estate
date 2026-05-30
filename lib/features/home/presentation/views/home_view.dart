import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_space/core/services/service_locator.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';
import 'package:home_space/features/home/domain/use_cases/get_sale_listings_use_case.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: BlocProvider(
            create: (context) => GetSaleListingsCubit(
              getSaleListingsUseCase: GetSaleListingsUseCase(
                homeRepo: getIt.get<HomeRepo>(),
              ),
            ),
            child: const HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
