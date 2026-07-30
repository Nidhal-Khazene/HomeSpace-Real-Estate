import 'package:home_space/core/services/api_service.dart';
import 'package:home_space/core/services/backend_breakpoint.dart';
import 'package:home_space/features/home/data/models/sale_listings_model.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/shared/constants.dart';

abstract class HomeRemoteDataSource {
  Future<List<SaleListingsEntity>> getSaleListings({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<SaleListingsEntity>> getSaleListings({int pageNumber = 0}) async {
    final data = await apiService.get(
      endPoint:
          "${BackendBreakpoint.kGetSaleListings}?city=Austin&state=TX&status=Active&limit=$kApiPaginationLimit&offset=${pageNumber * 10}",
    );
    return getListings(data);
  }

  List<SaleListingsEntity> getListings(data) {
    List<SaleListingsEntity> listings = [];
    for (var dataMap in data) {
      listings.add(SaleListingsModel.fromJson(dataMap));
    }
    return listings;
  }
}
