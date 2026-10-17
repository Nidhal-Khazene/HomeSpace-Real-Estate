import 'package:hive/hive.dart';
import 'package:home_space/core/services/hive_boxes.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/shared/constants.dart';

abstract class HomeLocalDataSource {
  List<SaleListingsEntity> getSaleListings({int pageNumber = 0});
  Future<void> saveSaleListings(
    List<SaleListingsEntity> listings, {
    bool clearFirst = false,
  });
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<SaleListingsEntity> getSaleListings({int pageNumber = 0}) {
    final box = Hive.box<SaleListingsEntity>(HiveBoxes.kSaleListings);
    final int length = box.values.length;
    final int startIndex = pageNumber * kApiPaginationLimit;

    if (startIndex >= length) {
      return [];
    }

    final int endIndex = (startIndex + kApiPaginationLimit).clamp(0, length);
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  Future<void> saveSaleListings(
    List<SaleListingsEntity> listings, {
    bool clearFirst = false,
  }) async {
    final box = Hive.box<SaleListingsEntity>(HiveBoxes.kSaleListings);

    if (clearFirst) {
      await box.clear();
      await box.addAll(listings);
      return;
    }

    final existingAddresses =
        box.values.map((item) => item.formattedAddress).toSet();
    final newItems = listings
        .where((item) => !existingAddresses.contains(item.formattedAddress))
        .toList();

    if (newItems.isNotEmpty) {
      await box.addAll(newItems);
    }
  }
}
