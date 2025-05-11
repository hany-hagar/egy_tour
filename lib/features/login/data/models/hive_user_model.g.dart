// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserModelAdapter extends TypeAdapter<HiveUserModel> {
  @override
  final int typeId = 3;

  @override
  HiveUserModel read(BinaryReader reader) {
    return HiveUserModel(
      id: reader.readString(),
      image: reader.readString(),
      name: reader.readString(),
      phone: reader.readString(),
      email: reader.readString(),
      password: reader.readString(),
      nationality: reader.readString(),
      birthday: reader.readString(),
      favouritesTourisms: reader.readList().cast<TourismModel>(),
      favouriteTours: reader.readList().cast<TourModel>(),
      favouriteHotels: reader.readList().cast<HotelModel>(),
      favouriteCars: reader.readList().cast<CarModel>(),
      freviewTourisms: reader.readList().cast<HiveTourismModel>(),
      reviewTours: reader.readList().cast<HiveTourModel>(),
      reviewHotels: reader.readList().cast<HiveHotelModel>(),
      reviewCars: reader.readList().cast<HiveCarModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.image);
    writer.writeString(obj.name);
    writer.writeString(obj.phone);
    writer.writeString(obj.email);
    writer.writeString(obj.password);
    writer.writeString(obj.nationality);
    writer.writeString(obj.birthday);
    writer.writeList(obj.favouritesTourisms);
    writer.writeList(obj.favouriteTours);
    writer.writeList(obj.favouriteHotels);
    writer.writeList(obj.favouriteCars);
    writer.writeList(obj.freviewTourisms);
    writer.writeList(obj.reviewTours);
    writer.writeList(obj.reviewHotels);
    writer.writeList(obj.reviewCars);
  }
}
