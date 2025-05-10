// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarModelAdapter extends TypeAdapter<CarModel> {
  @override
  final int typeId = 7;

  @override
  CarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarModel(
      carNumber: fields[5] as String,
      name: fields[6] as String,
      company: fields[7] as String,
      phone: fields[8] as String,
      price: fields[9] as String,
      model: fields[10] as String,
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      description: fields[2] as String,
      likes: fields[3] as double,
      location: fields[4] as String,
      reviews: (fields[11] as List).cast<ReviewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CarModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.likes)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.carNumber)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.company)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.model)
      ..writeByte(11)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
