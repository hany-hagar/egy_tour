// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_tour_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTourModelAdapter extends TypeAdapter<HiveTourModel> {
  @override
  final int typeId = 8;

  @override
  HiveTourModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTourModel(
      reviewIndex: fields[0] as int,
      model: fields[1] as TourModel,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTourModel obj) {
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
      other is HiveTourModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
