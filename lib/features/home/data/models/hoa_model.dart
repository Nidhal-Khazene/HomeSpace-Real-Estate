import '../../domain/entities/hoa_entity.dart';

class HoaModel {
  int? fee;

  HoaModel({this.fee});

  factory HoaModel.fromJson(Map<String, dynamic> json) =>
      HoaModel(fee: json['fee'] as int?);

  factory HoaModel.fromEntity(HoaEntity e) => HoaModel(fee: e.fee);

  Map<String, dynamic> toJson() => {'fee': fee};

  HoaEntity toEntity() => HoaEntity(fee: fee);
}
