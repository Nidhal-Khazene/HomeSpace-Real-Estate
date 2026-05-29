import 'package:hive/hive.dart';
import 'package:home_space/core/services/hive_boxes.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';

abstract class HomeLocalDataSource {
  List<SaleListingsEntity> getSaleListings({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<SaleListingsEntity> getSaleListings({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<SaleListingsEntity>(HiveBoxes.kSaleListings);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
