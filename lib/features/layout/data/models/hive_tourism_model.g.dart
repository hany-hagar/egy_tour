// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_tourism_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTourismModelAdapter extends TypeAdapter<HiveTourismModel> {
  @override
  final int typeId = 11;

  @override
  HiveTourismModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTourismModel(
      reviewIndex: fields[0] as int,
      model: fields[1] as TourismModel,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTourismModel obj) {
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
      other is HiveTourismModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
