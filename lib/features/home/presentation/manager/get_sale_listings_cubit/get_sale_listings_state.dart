part of 'get_sale_listings_cubit.dart';

@immutable
sealed class GetSaleListingsState extends Equatable {
  const GetSaleListingsState();

  @override
  List<Object?> get props => [];
}

final class GetSaleListingsInitial extends GetSaleListingsState {}

final class GetSaleListingsLoading extends GetSaleListingsState {}

final class GetSaleListingsSuccess extends GetSaleListingsState {
  final List<SaleListingsEntity> listings;
  final bool hasMore;
  final bool isPaginationLoading;
  final String selectedCategory;

  const GetSaleListingsSuccess({
    required this.listings,
    this.hasMore = true,
    this.isPaginationLoading = false,
    this.selectedCategory = 'All',
  });

  GetSaleListingsSuccess copyWith({
    List<SaleListingsEntity>? listings,
    bool? hasMore,
    bool? isPaginationLoading,
    String? selectedCategory,
  }) {
    return GetSaleListingsSuccess(
      listings: listings ?? this.listings,
      hasMore: hasMore ?? this.hasMore,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [
        listings,
        hasMore,
        isPaginationLoading,
        selectedCategory,
      ];
}

final class GetSaleListingsFailure extends GetSaleListingsState {
  final String errMessage;

  const GetSaleListingsFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

final class GetSaleListingsPaginationFailure extends GetSaleListingsState {
  final String errMessage;

  const GetSaleListingsPaginationFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}
