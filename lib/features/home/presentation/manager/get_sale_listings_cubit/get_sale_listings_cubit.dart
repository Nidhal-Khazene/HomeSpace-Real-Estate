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
  final List<SaleListingsEntity> _allSaleListings = [];
  String _currentPropertyType = 'All';
  bool _hasMoreData = true;

  Future<dynamic> getSaleListings({
    bool isRefresh = false,
  }) async {
    if (_isLoading) return;
    if (!_hasMoreData && !isRefresh) return;

    if (isRefresh) {
      _pageNumber = 1;
      _allSaleListings.clear();
      _currentPropertyType = 'All';
      _hasMoreData = true;
    }

    _isLoading = true;

    if (_pageNumber == 1) {
      emit(GetSaleListingsLoading());
    } else {
      emit(GetSaleListingsPaginationLoading());
    }

    var result = await getSaleListingsUseCase.call(
      _pageNumber,
      null, // Fetch all listings without backend propertyType filter
    );
    result.fold(
      (failure) {
        if (isClosed) return;
        _isLoading = false;
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
        _isLoading = false;
        if (listings.isEmpty) {
          _hasMoreData = false;
        } else {
          _pageNumber++;
          _allSaleListings.addAll(listings);
        }
        _emitFilteredListings();
      },
    );
  }

  void filterByCategory(String category) {
    if (_currentPropertyType == category) return;
    
    _currentPropertyType = category;
    if (!isClosed) emit(GetSaleListingsFilterLoading());
    
    // Small delay to make the filter transition look smooth with the loading indicator
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!isClosed) _emitFilteredListings();
    });
  }

  void _emitFilteredListings() {
    if (isClosed) return;
    if (_currentPropertyType == 'All') {
      emit(GetSaleListingsSuccess(listings: List.from(_allSaleListings)));
    } else {
      final filteredList = _allSaleListings.where((listing) {
        return listing.propertyType.toLowerCase() == _currentPropertyType.toLowerCase();
      }).toList();
      emit(GetSaleListingsSuccess(listings: filteredList));
    }
  }
}
