import '../../domain/entities/listing_agent_entity.dart';

class ListingAgentModel {
  String? name;
  String? phone;
  String? email;
  String? website;

  ListingAgentModel({this.name, this.phone, this.email, this.website});

  factory ListingAgentModel.fromJson(Map<String, dynamic> json) =>
      ListingAgentModel(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        website: json['website'] as String?,
      );

  factory ListingAgentModel.fromEntity(ListingAgentEntity e) =>
      ListingAgentModel(
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

  ListingAgentEntity toEntity() => ListingAgentEntity(
    name: name,
    phone: phone,
    email: email,
    website: website,
  );
}
