import 'package:home_space/core/services/api_service.dart';
import 'package:home_space/core/services/backend_breakpoint.dart';
import 'package:home_space/features/home/data/models/sale_listings_model.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/shared/functions/get_category_titles.dart';

abstract class HomeRemoteDataSource {
  Future<List<SaleListingsEntity>> getSaleListings({
    int pageNumber = 0,
    String? propertyType,
  });
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<SaleListingsEntity>> getSaleListings({
    int pageNumber = 0,
    String? propertyType,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'city': 'Austin',
      'state': 'TX',
      'status': 'Active',
      'bedrooms': [2, 3],
      'limit': kApiPaginationLimit,
      'offset': pageNumber * kApiPaginationLimit,
    };

    // RentCast valid types exclude 'All'
    if (propertyType != null && propertyType.toLowerCase() != 'all') {
      queryParameters['propertyType'] = propertyType;
    } else {
      // Pass all valid categories except 'All'
      final validCategories =
          getCategoryTitles().where((cat) => cat.toLowerCase() != 'all').toList();
      queryParameters['propertyType'] = validCategories;
    }

    final data = await apiService.get(
      endPoint: BackendBreakpoint.kGetSaleListings,
      queryParameters: queryParameters,
    );

    return getListings(data);
  }

  List<SaleListingsEntity> getListings(dynamic data) {
    final List<SaleListingsEntity> listings = [];
    if (data is List) {
      for (final dataMap in data) {
        if (dataMap is Map<String, dynamic>) {
          listings.add(SaleListingsModel.fromJson(dataMap));
        }
      }
    }
    return listings;
  }
}
