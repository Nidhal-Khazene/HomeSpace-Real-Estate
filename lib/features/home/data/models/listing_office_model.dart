import '../../domain/entities/listing_office_entity.dart';

class ListingOfficeModel {
  String? name;
  String? phone;
  String? email;
  String? website;

  ListingOfficeModel({this.name, this.phone, this.email, this.website});

  factory ListingOfficeModel.fromJson(Map<String, dynamic> json) =>
      ListingOfficeModel(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        website: json['website'] as String?,
      );

  factory ListingOfficeModel.fromEntity(ListingOfficeEntity e) =>
      ListingOfficeModel(
        name: e.name,
        phone: e.phone,
        email: e.email,
        website: e.website,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'website': website,
  };

  ListingOfficeEntity toEntity() => ListingOfficeEntity(
    name: name,
    phone: phone,
    email: email,
    website: website,
  );
}
