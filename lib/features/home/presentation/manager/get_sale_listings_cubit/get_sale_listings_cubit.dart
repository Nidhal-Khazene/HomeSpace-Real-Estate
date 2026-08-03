import 'package:bloc/bloc.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/use_cases/get_sale_listings_use_case.dart';
import 'package:meta/meta.dart';

part 'get_sale_listings_state.dart';

class GetSaleListingsCubit extends Cubit<GetSaleListingsState> {
  GetSaleListingsCubit({required this.getSaleListingsUseCase})
    : super(GetSaleListingsInitial());

  final GetSaleListingsUseCase getSaleListingsUseCase;

  int _pageNumber = 1;
  bool _isLoading = false;
  bool _hasMoreData = true;
  String _currentPropertyType = 'All';
  final List<SaleListingsEntity> _allSaleListings = [];

  // Minimum number of matching items we want available before we stop
  // auto-fetching more pages for the active filter. Tune to taste.
  static const int _minFilteredResults = 10;

  Future<void> getSaleListings({bool isRefresh = false}) async {
    if (_isLoading) return;
    if (!_hasMoreData && !isRefresh) return;

    if (isRefresh) {
      _pageNumber = 1;
      _allSaleListings.clear();
      _currentPropertyType = 'All';
      _hasMoreData = true;
      _consecutiveAutoFetchCount = 0;
    }

    _isLoading = true;

    if (_pageNumber == 1) {
      emit(GetSaleListingsLoading());
    } else {
      emit(GetSaleListingsPaginationLoading());
    }

    final result = await getSaleListingsUseCase.call(
      _pageNumber,
      null, // Fetch all listings without backend propertyType filter
    );

    if (isClosed) return;
    _isLoading = false;

    result.fold(
      (failure) {
        if (isClosed) return;
        if (_pageNumber == 1) {
          emit(GetSaleListingsFailure(errMessage: failure.errMessage));
        } else {
          emit(
            GetSaleListingsPaginationFailure(errMessage: failure.errMessage),
          );
        }
      },
      (listings) {
        if (isClosed) return;
        if (listings.isEmpty) {
          _hasMoreData = false;
        } else {
          _pageNumber++;
          _allSaleListings.addAll(listings);
        }
        _emitFilteredListings();
        _autoFetchMoreIfFilterIsThin();
      },
    );
  }

  void filterByCategory(String category) {
    if (_currentPropertyType == category) return;

    _currentPropertyType = category;
    _consecutiveAutoFetchCount = 0;

    if (!isClosed) emit(GetSaleListingsFilterLoading());
    // No artificial delay: emit as soon as the filtered list is ready.
    // If you want a smooth transition, animate it in the widget with
    // an AnimatedSwitcher keyed off the state type instead of faking
    // it with a Future.delayed here.
    _emitFilteredListings(isLocalFilter: true);
    _autoFetchMoreIfFilterIsThin();
  }

  int _consecutiveAutoFetchCount = 0;

  /// Filtering can narrow the visible list down to just a few items,
  /// which means the list may no longer scroll — and since pagination
  /// is triggered by scroll position, the user would get stuck on a
  /// near-empty filtered view with no way to load more. This keeps
  /// fetching pages in the background until we have enough matches
  /// for the active filter, or the backend runs out of data.
  void _autoFetchMoreIfFilterIsThin() {
    if (_currentPropertyType == 'All') return;
    if (!_hasMoreData || _isLoading) return;

    final filteredCount = _allSaleListings
        .where(
          (listing) =>
              listing.propertyType.toLowerCase() ==
              _currentPropertyType.toLowerCase(),
        )
        .length;

    // Cap the number of consecutive auto-fetches to prevent infinite API call loops
    // when a category has very few items in the entire database.
    if (filteredCount < _minFilteredResults && _consecutiveAutoFetchCount < 3) {
      _consecutiveAutoFetchCount++;
      getSaleListings();
    }
  }

  void _emitFilteredListings({bool isLocalFilter = false}) {
    if (isClosed) return;

    final targetList = _currentPropertyType == 'All'
        ? List<SaleListingsEntity>.from(_allSaleListings)
        : _allSaleListings
              .where(
                (listing) =>
                    listing.propertyType.toLowerCase() ==
                    _currentPropertyType.toLowerCase(),
              )
              .toList();

    if (isLocalFilter) {
      emit(GetSaleListingsFilterSuccess(listings: targetList));
    } else {
      emit(GetSaleListingsSuccess(listings: targetList));
    }
  }
}
