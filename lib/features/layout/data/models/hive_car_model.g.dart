// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_car_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCarModelAdapter extends TypeAdapter<HiveCarModel> {
  @override
  final int typeId = 10;

  @override
  HiveCarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCarModel(
      reviewIndex: fields[0] as int,
      model: fields[1] as CarModel,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCarModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.reviewIndex)
      ..writeByte(1)
      ..write(obj.model);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
