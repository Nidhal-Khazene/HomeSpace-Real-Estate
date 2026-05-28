import '../../domain/entities/sale_listings_entity.dart';

class SaleListingsModel {
  final num price;
  final String formattedAddress;
  final String agentName;
  final String propertyType;
  final int bedrooms;
  final double bathrooms;
  final int squareFootage;
  final int lotSize;
  final String city;

  SaleListingsModel({
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

  factory SaleListingsModel.fromJson(Map<String, dynamic> json) =>
      SaleListingsModel(
        price: json['price'] as num,
        formattedAddress: json['formattedAddress'] as String,
        agentName: json['agentName'] as String,
        propertyType: json['propertyType'] as String,
        bedrooms: json['bedrooms'] as int,
        bathrooms: (json['bathrooms'] as num).toDouble(),
        squareFootage: json['squareFootage'] as int,
        lotSize: json['lotSize'] as int,
        city: json['city'] as String,
      );

  Map<String, dynamic> toJson() => {
    'price': price,
    'formattedAddress': formattedAddress,
    'agentName': agentName,
    'propertyType': propertyType,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'squareFootage': squareFootage,
    'lotSize': lotSize,
    'city': city,
  };

  factory SaleListingsModel.fromEntity(SaleListingsEntity e) =>
      SaleListingsModel(
        price: e.price,
        formattedAddress: e.formattedAddress,
        agentName: e.agentName,
        propertyType: e.propertyType,
        bedrooms: e.bedrooms,
        bathrooms: e.bathrooms,
        squareFootage: e.squareFootage,
        lotSize: e.lotSize,
        city: e.city,
      );

  SaleListingsEntity toEntity() => SaleListingsEntity(
    price: price,
    formattedAddress: formattedAddress,
    agentName: agentName,
    propertyType: propertyType,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    squareFootage: squareFootage,
    lotSize: lotSize,
    city: city,
  );
}
