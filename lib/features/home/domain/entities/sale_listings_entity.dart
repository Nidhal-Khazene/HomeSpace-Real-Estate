import 'hoa_entity.dart';
import 'listing_agent_entity.dart';
import 'listing_office_entity.dart';

class SaleListingsEntity {
  String? id;
  String? formattedAddress;
  String? addressLine1;
  dynamic addressLine2;
  String? city;
  String? state;
  String? stateFips;
  String? zipCode;
  String? county;
  String? countyFips;
  double? latitude;
  double? longitude;
  String? propertyType;
  int? bedrooms;
  double? bathrooms;
  int? squareFootage;
  int? lotSize;
  int? yearBuilt;
  HoaEntity? hoa;
  String? status;
  int? price;
  String? listingType;
  DateTime? listedDate;
  dynamic removedDate;
  DateTime? createdDate;
  DateTime? lastSeenDate;
  int? daysOnMarket;
  String? mlsName;
  String? mlsNumber;
  ListingAgentEntity? listingAgent;
  ListingOfficeEntity? listingOffice;

  SaleListingsEntity({
    this.id,
    this.formattedAddress,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.stateFips,
    this.zipCode,
    this.county,
    this.countyFips,
    this.latitude,
    this.longitude,
    this.propertyType,
    this.bedrooms,
    this.bathrooms,
    this.squareFootage,
    this.lotSize,
    this.yearBuilt,
    this.hoa,
    this.status,
    this.price,
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
  });

  factory SaleListingsEntity.fromJson(Map<String, dynamic> json) {
    return SaleListingsEntity(
      id: json['id'] as String?,
      formattedAddress: json['formattedAddress'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as dynamic,
      city: json['city'] as String?,
      state: json['state'] as String?,
      stateFips: json['stateFips'] as String?,
      zipCode: json['zipCode'] as String?,
      county: json['county'] as String?,
      countyFips: json['countyFips'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      propertyType: json['propertyType'] as String?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: (json['bathrooms'] as num?)?.toDouble(),
      squareFootage: json['squareFootage'] as int?,
      lotSize: json['lotSize'] as int?,
      yearBuilt: json['yearBuilt'] as int?,
      hoa: json['hoa'] == null
          ? null
          : HoaEntity.fromJson(json['hoa'] as Map<String, dynamic>),
      status: json['status'] as String?,
      price: json['price'] as int?,
      listingType: json['listingType'] as String?,
      listedDate: json['listedDate'] == null
          ? null
          : DateTime.parse(json['listedDate'] as String),
      removedDate: json['removedDate'] as dynamic,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastSeenDate: json['lastSeenDate'] == null
          ? null
          : DateTime.parse(json['lastSeenDate'] as String),
      daysOnMarket: json['daysOnMarket'] as int?,
      mlsName: json['mlsName'] as String?,
      mlsNumber: json['mlsNumber'] as String?,
      listingAgent: json['listingAgent'] == null
          ? null
          : ListingAgentEntity.fromJson(
              json['listingAgent'] as Map<String, dynamic>,
            ),
      listingOffice: json['listingOffice'] == null
          ? null
          : ListingOfficeEntity.fromJson(
              json['listingOffice'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
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
    'price': price,
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
