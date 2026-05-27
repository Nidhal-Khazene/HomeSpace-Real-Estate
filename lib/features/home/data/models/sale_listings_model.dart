import 'hoa_model.dart';
import 'listing_agent_model.dart';
import 'listing_office_model.dart';
import '../../domain/entities/sale_listings_entity.dart';

class SaleListingsModel {
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
  HoaModel? hoa;
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
  ListingAgentModel? listingAgent;
  ListingOfficeModel? listingOffice;

  SaleListingsModel({
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

  factory SaleListingsModel.fromJson(Map<String, dynamic> json) {
    return SaleListingsModel(
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
          : HoaModel.fromJson(json['hoa'] as Map<String, dynamic>),
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
          : ListingAgentModel.fromJson(
              json['listingAgent'] as Map<String, dynamic>,
            ),
      listingOffice: json['listingOffice'] == null
          ? null
          : ListingOfficeModel.fromJson(
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

  factory SaleListingsModel.fromEntity(SaleListingsEntity e) =>
      SaleListingsModel(
        id: e.id,
        formattedAddress: e.formattedAddress,
        addressLine1: e.addressLine1,
        addressLine2: e.addressLine2,
        city: e.city,
        state: e.state,
        stateFips: e.stateFips,
        zipCode: e.zipCode,
        county: e.county,
        countyFips: e.countyFips,
        latitude: e.latitude,
        longitude: e.longitude,
        propertyType: e.propertyType,
        bedrooms: e.bedrooms,
        bathrooms: e.bathrooms,
        squareFootage: e.squareFootage,
        lotSize: e.lotSize,
        yearBuilt: e.yearBuilt,
        hoa: e.hoa == null ? null : HoaModel.fromEntity(e.hoa!),
        status: e.status,
        price: e.price,
        listingType: e.listingType,
        listedDate: e.listedDate,
        removedDate: e.removedDate,
        createdDate: e.createdDate,
        lastSeenDate: e.lastSeenDate,
        daysOnMarket: e.daysOnMarket,
        mlsName: e.mlsName,
        mlsNumber: e.mlsNumber,
        listingAgent: e.listingAgent == null
            ? null
            : ListingAgentModel.fromEntity(e.listingAgent!),
        listingOffice: e.listingOffice == null
            ? null
            : ListingOfficeModel.fromEntity(e.listingOffice!),
      );

  SaleListingsEntity toEntity() => SaleListingsEntity(
    id: id,
    formattedAddress: formattedAddress,
    addressLine1: addressLine1,
    addressLine2: addressLine2,
    city: city,
    state: state,
    stateFips: stateFips,
    zipCode: zipCode,
    county: county,
    countyFips: countyFips,
    latitude: latitude,
    longitude: longitude,
    propertyType: propertyType,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    squareFootage: squareFootage,
    lotSize: lotSize,
    yearBuilt: yearBuilt,
    hoa: hoa == null ? null : hoa!.toEntity(),
    status: status,
    price: price,
    listingType: listingType,
    listedDate: listedDate,
    removedDate: removedDate,
    createdDate: createdDate,
    lastSeenDate: lastSeenDate,
    daysOnMarket: daysOnMarket,
    mlsName: mlsName,
    mlsNumber: mlsNumber,
    listingAgent: listingAgent == null ? null : listingAgent!.toEntity(),
    listingOffice: listingOffice == null ? null : listingOffice!.toEntity(),
  );
}
