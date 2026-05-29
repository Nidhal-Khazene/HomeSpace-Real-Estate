import 'package:hive/hive.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';

void saveCachedSaleListingsData(
  List<SaleListingsEntity> listings,
  String listingsName,
) {
  var box = Hive.box<SaleListingsEntity>(listingsName);
  box.addAll(listings);
}
