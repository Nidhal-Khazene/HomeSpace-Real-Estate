class Hoa {
  int? fee;

  Hoa({this.fee});

  factory Hoa.fromJson(Map<String, dynamic> json) =>
      Hoa(fee: json['fee'] as int?);

  Map<String, dynamic> toJson() => {'fee': fee};
}
