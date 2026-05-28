class SaleListingsEntity {
  final num price;
  final String formattedAddress;
  final String agentName;
  final String propertyType;
  final int bedrooms;
  final double bathrooms;
  final int squareFootage;
  final int lotSize;
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
