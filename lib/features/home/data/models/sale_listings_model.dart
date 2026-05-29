import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';

import 'hoa.dart';
import 'listing_agent.dart';
import 'listing_office.dart';

class SaleListingsModel extends SaleListingsEntity {
  final String? id;
  final String? addressLine1;
  final dynamic addressLine2;
  final String? state;
  final String? stateFips;
  final String? zipCode;
  final String? county;
  final String? countyFips;
  final double? latitude;
  final double? longitude;
  final int? yearBuilt;
  final Hoa? hoa;
  final String? status;
  final String? listingType;
  final DateTime? listedDate;
  final dynamic removedDate;
  final DateTime? createdDate;
  final DateTime? lastSeenDate;
  final int? daysOnMarket;
  final String? mlsName;
  final String? mlsNumber;
  final ListingAgent? listingAgent;
  final ListingOffice? listingOffice;

  SaleListingsModel({
    this.id,
    required super.price,
    required super.formattedAddress,
    this.addressLine1,
    this.addressLine2,
    required super.city,
    this.state,
    this.stateFips,
    this.zipCode,
    this.county,
    this.countyFips,
    this.latitude,
    this.longitude,
    required super.propertyType,
    required super.bedrooms,
    required super.bathrooms,
    required super.squareFootage,
    required super.lotSize,
    this.yearBuilt,
    this.hoa,
    this.status,
    this.listingType,
    this.listedDate,
    this.removedDate,
    this.createdDate,
    this.lastSeenDate,
    this.daysOnMarket,
    this.mlsName,
    this.mlsNumber,
    this.listingAgent,
    this.listingOffice,
    required super.agentName,
  });

  factory SaleListingsModel.fromJson(Map<String, dynamic> json) {
    return SaleListingsModel(
      id: json['id'],
      price: json['price'] ?? 0,
      formattedAddress: json['formattedAddress'] ?? '',
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      city: json['city'] ?? '',
      state: json['state'],
      stateFips: json['stateFips'],
      zipCode: json['zipCode'],
      county: json['county'],
      countyFips: json['countyFips'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      propertyType: json['propertyType'] ?? '',
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: (json['bathrooms'] as num?)?.toDouble() ?? 0.0,
      squareFootage: json['squareFootage'] ?? 0,
      lotSize: json['lotSize'] ?? 0,
      yearBuilt: json['yearBuilt'],
      hoa: json['hoa'] != null ? Hoa.fromJson(json['hoa']) : null,
      status: json['status'],
      listingType: json['listingType'],
      listedDate: json['listedDate'] != null
          ? DateTime.parse(json['listedDate'])
          : null,
      removedDate: json['removedDate'],
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : null,
      lastSeenDate: json['lastSeenDate'] != null
          ? DateTime.parse(json['lastSeenDate'])
          : null,
      daysOnMarket: json['daysOnMarket'],
      mlsName: json['mlsName'],
      mlsNumber: json['mlsNumber'],
      listingAgent: json['listingAgent'] != null
          ? ListingAgent.fromJson(json['listingAgent'])
          : null,
      listingOffice: json['listingOffice'] != null
          ? ListingOffice.fromJson(json['listingOffice'])
          : null,
      agentName: json['listingAgent']?['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'formattedAddress': formattedAddress,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'stateFips': stateFips,
      'zipCode': zipCode,
      'county': county,
      'countyFips': countyFips,
      'latitude': latitude,
      'longitude': longitude,
      'propertyType': propertyType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'squareFootage': squareFootage,
      'lotSize': lotSize,
      'yearBuilt': yearBuilt,
      'hoa': hoa?.toJson(),
      'status': status,
      'listingType': listingType,
      'listedDate': listedDate?.toIso8601String(),
      'removedDate': removedDate,
      'createdDate': createdDate?.toIso8601String(),
      'lastSeenDate': lastSeenDate?.toIso8601String(),
      'daysOnMarket': daysOnMarket,
      'mlsName': mlsName,
      'mlsNumber': mlsNumber,
      'listingAgent': listingAgent?.toJson(),
      'listingOffice': listingOffice?.toJson(),
    };
  }
}
