import 'package:hive/hive.dart';

part 'sale_listings_entity.g.dart';

@HiveType(typeId: 0)
class SaleListingsEntity {
  @HiveField(0)
  final num price;
  @HiveField(1)
  final String formattedAddress;
  @HiveField(2)
  final String agentName;
  @HiveField(3)
  final String propertyType;
  @HiveField(4)
  final int bedrooms;
  @HiveField(5)
  final double bathrooms;
  @HiveField(6)
  final int squareFootage;
  @HiveField(7)
  final int lotSize;
  @HiveField(8)
  final String city;

  SaleListingsEntity({
    required this.price,
    required this.formattedAddress,
    required this.agentName,
    required this.propertyType,
    required this.bedrooms,
    required this.bathrooms,
    required this.squareFootage,
    required this.lotSize,
    required this.city,
  });
}
