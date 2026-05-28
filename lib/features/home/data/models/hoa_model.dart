class HoaModel {
  int? fee;

  HoaModel({this.fee});

  factory HoaModel.fromJson(Map<String, dynamic> json) =>
      HoaModel(fee: json['fee'] as int?);

  Map<String, dynamic> toJson() => {'fee': fee};
}
