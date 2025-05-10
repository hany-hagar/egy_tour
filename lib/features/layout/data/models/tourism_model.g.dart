// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourism_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TourismModelAdapter extends TypeAdapter<TourismModel> {
  @override
  final int typeId = 6;

  @override
  TourismModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TourismModel(
      id: fields[0] as String,
      name: fields[1] as String,
      location: fields[2] as String,
      rating: fields[3] as double,
      numberOfRatings: fields[4] as int,
      openTime: fields[5] as String,
      price: fields[6] as String,
      description: fields[7] as String,
      facilities: (fields[8] as List).cast<String>(),
      images: (fields[9] as List).cast<String>(),
      reviews: (fields[10] as List).cast<ReviewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, TourismModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.numberOfRatings)
      ..writeByte(5)
      ..write(obj.openTime)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.facilities)
      ..writeByte(9)
      ..write(obj.images)
      ..writeByte(10)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TourismModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
