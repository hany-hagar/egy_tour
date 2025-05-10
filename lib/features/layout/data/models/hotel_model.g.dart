// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelModelAdapter extends TypeAdapter<HotelModel> {
  @override
  final int typeId = 4;

  @override
  HotelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HotelModel(
      id: fields[0] as String,
      name: fields[1] as String,
      address: fields[2] as String,
      rating: fields[3] as double,
      reviewCount: fields[4] as int,
      pricePerNight: fields[5] as double,
      roomType: fields[6] as String,
      checkInTime: fields[7] as String,
      checkOutTime: fields[8] as String,
      description: fields[9] as String,
      amenities: (fields[10] as List).cast<String>(),
      roomImages: (fields[11] as List).cast<String>(),
      policies: (fields[12] as List).cast<String>(),
      reviews: (fields[13] as List).cast<ReviewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HotelModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.reviewCount)
      ..writeByte(5)
      ..write(obj.pricePerNight)
      ..writeByte(6)
      ..write(obj.roomType)
      ..writeByte(7)
      ..write(obj.checkInTime)
      ..writeByte(8)
      ..write(obj.checkOutTime)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.amenities)
      ..writeByte(11)
      ..write(obj.roomImages)
      ..writeByte(12)
      ..write(obj.policies)
      ..writeByte(13)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
