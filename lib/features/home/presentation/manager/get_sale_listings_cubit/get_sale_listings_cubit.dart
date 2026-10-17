import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/use_cases/get_sale_listings_use_case.dart';

part 'get_sale_listings_state.dart';

class GetSaleListingsCubit extends Cubit<GetSaleListingsState> {
  GetSaleListingsCubit({required this.getSaleListingsUseCase})
      : super(GetSaleListingsInitial());

  final GetSaleListingsUseCase getSaleListingsUseCase;

  int _pageNumber = 0;
  bool _isLoading = false;
  bool _hasMoreData = true;
  String _currentPropertyType = 'All';
  final List<SaleListingsEntity> _allSaleListings = [];

  bool get isLoading => _isLoading;
  bool get hasMoreData => _hasMoreData;
  String get currentPropertyType => _currentPropertyType;

  Future<void> getSaleListings({bool isRefresh = false}) async {
    if (_isLoading) return;
    if (!_hasMoreData && !isRefresh) return;

    if (isRefresh) {
      _pageNumber = 0;
      _allSaleListings.clear();
      _hasMoreData = true;
    }

    _isLoading = true;

    if (_pageNumber == 0) {
      emit(GetSaleListingsLoading());
    } else if (state is GetSaleListingsSuccess) {
      emit(
        (state as GetSaleListingsSuccess).copyWith(isPaginationLoading: true),
      );
    }

    final result = await getSaleListingsUseCase.call(
      GetSaleListingsParams(
        pageNumber: _pageNumber,
        propertyType: _currentPropertyType,
      ),
    );

    if (isClosed) return;
    _isLoading = false;

    result.fold(
      (failure) {
        if (isClosed) return;
        if (_pageNumber == 0) {
          emit(GetSaleListingsFailure(errMessage: failure.errMessage));
        } else {
          if (state is GetSaleListingsSuccess) {
            emit(
              (state as GetSaleListingsSuccess).copyWith(
                isPaginationLoading: false,
              ),
            );
          }
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

        emit(
          GetSaleListingsSuccess(
            listings: List.unmodifiable(_allSaleListings),
            hasMore: _hasMoreData,
            isPaginationLoading: false,
            selectedCategory: _currentPropertyType,
          ),
        );
      },
    );
  }

  Future<void> filterByCategory(String category) async {
    if (_currentPropertyType == category && _allSaleListings.isNotEmpty) return;

    _currentPropertyType = category;
    _pageNumber = 0;
    _allSaleListings.clear();
    _hasMoreData = true;

    await getSaleListings();
  }
}
