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

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'website': website,
  };
}
