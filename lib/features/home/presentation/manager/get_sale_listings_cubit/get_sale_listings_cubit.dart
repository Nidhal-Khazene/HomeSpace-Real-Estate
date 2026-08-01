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
  final List<SaleListingsEntity> _saleListings = [];

  Future<dynamic> getSaleListings({
    bool isRefresh = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (_isLoading) return;

    if (isRefresh) {
      _pageNumber = 1;
      _saleListings.clear();
    }

    _isLoading = true;

    if (_pageNumber == 1) {
      emit(GetSaleListingsLoading());
    } else {
      emit(GetSaleListingsPaginationLoading());
    }

    var result = await getSaleListingsUseCase.call(
      _pageNumber,
      queryParameters,
    );
    result.fold(
      (failure) {
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
        _isLoading = false;
        _pageNumber++;
        _saleListings.addAll(listings);
        emit(GetSaleListingsSuccess(listings: List.from(_saleListings)));
      },
    );
  }
}
