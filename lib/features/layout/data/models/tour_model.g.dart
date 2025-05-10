// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TourModelAdapter extends TypeAdapter<TourModel> {
  @override
  final int typeId = 5;

  @override
  TourModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TourModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      days: fields[3] as int,
      people: fields[4] as int,
      price: fields[5] as String,
      location: fields[6] as String,
      hostName: fields[7] as String,
      phone: fields[8] as String,
      rating: fields[9] as double,
      imageUrl: fields[10] as String,
      reviews: (fields[11] as List).cast<ReviewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, TourModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.days)
      ..writeByte(4)
      ..write(obj.people)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.hostName)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.imageUrl)
      ..writeByte(11)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TourModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
