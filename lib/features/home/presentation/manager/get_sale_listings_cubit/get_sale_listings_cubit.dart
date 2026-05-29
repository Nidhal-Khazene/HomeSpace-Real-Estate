import 'package:bloc/bloc.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/use_cases/get_sale_listings_use_case.dart';
import 'package:meta/meta.dart';

part 'get_sale_listings_state.dart';

class GetSaleListingsCubit extends Cubit<GetSaleListingsState> {
  GetSaleListingsCubit({required this.getSaleListingsUseCase})
    : super(GetSaleListingsInitial());
  final GetSaleListingsUseCase getSaleListingsUseCase;
  Future<dynamic> getSaleListings({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(GetSaleListingsLoading());
    } else {
      emit(GetSaleListingsPaginationLoading());
    }
    var result = await getSaleListingsUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(GetSaleListingsFailure(errMessage: failure.errMessage));
      } else {
        emit(GetSaleListingsPaginationFailure(errMessage: failure.errMessage));
      }
    }, (listings) => emit(GetSaleListingsSuccess(listings: listings)));
  }
}
