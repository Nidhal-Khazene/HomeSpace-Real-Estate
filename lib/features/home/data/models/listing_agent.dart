class ListingAgent {
  String? name;
  String? phone;
  String? email;
  String? website;

  ListingAgent({this.name, this.phone, this.email, this.website});

  factory ListingAgent.fromJson(Map<String, dynamic> json) => ListingAgent(
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
