class ListingAgentEntity {
  String? name;
  String? phone;
  String? email;
  String? website;

  ListingAgentEntity({this.name, this.phone, this.email, this.website});

  factory ListingAgentEntity.fromJson(Map<String, dynamic> json) =>
      ListingAgentEntity(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        website: json['website'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'website': website,
  };
}
