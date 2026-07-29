part of 'get_sale_listings_cubit.dart';

@immutable
sealed class GetSaleListingsState {}

final class GetSaleListingsInitial extends GetSaleListingsState {}

final class GetSaleListingsLoading extends GetSaleListingsState {}

final class GetSaleListingsSuccess extends GetSaleListingsState {
  final List<SaleListingsEntity> listings;

  GetSaleListingsSuccess({required this.listings});
}

final class GetSaleListingsFailure extends GetSaleListingsState {
  final String errMessage;

  GetSaleListingsFailure({required this.errMessage});
}

final class GetSaleListingsPaginationLoading extends GetSaleListingsState {}

final class GetSaleListingsPaginationFailure extends GetSaleListingsState {
  final String errMessage;

  GetSaleListingsPaginationFailure({required this.errMessage});
}
