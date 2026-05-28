import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_space/core/services/hive_boxes.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SaleListingsEntityAdapter());
  await Hive.openBox<SaleListingsEntity>(HiveBoxes.kSaleListings);
}
