// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_listings_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleListingsEntityAdapter extends TypeAdapter<SaleListingsEntity> {
  @override
  final int typeId = 0;

  @override
  SaleListingsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleListingsEntity(
      price: fields[0] as num,
      formattedAddress: fields[1] as String,
      agentName: fields[2] as String,
      propertyType: fields[3] as String,
      bedrooms: fields[4] as int,
      bathrooms: fields[5] as double,
      squareFootage: fields[6] as int,
      lotSize: fields[7] as int,
      city: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SaleListingsEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.formattedAddress)
      ..writeByte(2)
      ..write(obj.agentName)
      ..writeByte(3)
      ..write(obj.propertyType)
      ..writeByte(4)
      ..write(obj.bedrooms)
      ..writeByte(5)
      ..write(obj.bathrooms)
      ..writeByte(6)
      ..write(obj.squareFootage)
      ..writeByte(7)
      ..write(obj.lotSize)
      ..writeByte(8)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleListingsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
