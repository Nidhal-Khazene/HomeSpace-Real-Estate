class HoaEntity {
  int? fee;

  HoaEntity({this.fee});

  factory HoaEntity.fromJson(Map<String, dynamic> json) =>
      HoaEntity(fee: json['fee'] as int?);

  Map<String, dynamic> toJson() => {'fee': fee};
}
