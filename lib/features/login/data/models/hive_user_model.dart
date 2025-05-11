// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tour_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tourism_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';
part 'hive_user_model.g.dart';

@HiveType(typeId: 3)
class HiveUserModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String email;
  @HiveField(5)
  String password;
  @HiveField(6)
  final String nationality;
  @HiveField(7)
  final String birthday;

  @HiveField(8)
  List<TourismModel> favouritesTourisms;
  @HiveField(9)
  List<TourModel> favouriteTours;
  @HiveField(10)
  List<HotelModel> favouriteHotels;
  @HiveField(11)
  List<CarModel> favouriteCars;
  @HiveField(12)
  List<HiveTourismModel> freviewTourisms;
  @HiveField(13)
  List<HiveTourModel> reviewTours;
  @HiveField(14)
  List<HiveHotelModel> reviewHotels;
  @HiveField(15)
  List<HiveCarModel> reviewCars;

  HiveUserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.nationality,
    required this.birthday,
    required this.favouritesTourisms,
    required this.favouriteTours,
    required this.favouriteHotels,
    required this.favouriteCars,
    required this.freviewTourisms,
    required this.reviewTours,
    required this.reviewHotels,
    required this.reviewCars,
  });

  factory HiveUserModel.fromJson(Map<String, dynamic> json, String id, String password) {
    return HiveUserModel(
      id: id,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      password: password,
      nationality: json['nationality'] ?? '',
      birthday: json['birthday'] ?? '',
      favouritesTourisms: (json['favouritesTourisms'] as List<dynamic>?)
              ?.map((e) => TourismModel.fromJson(e))
              .toList() ?? [],
      favouriteTours: (json['favouriteTours'] as List<dynamic>?)
              ?.map((e) => TourModel.fromJson(e))
              .toList() ?? [],
      favouriteHotels: (json['favouriteHotels'] as List<dynamic>?)
              ?.map((e) => HotelModel.fromJson(e))
              .toList() ?? [],
      favouriteCars: (json['favouriteCars'] as List<dynamic>?)
              ?.map((e) => CarModel.fromJson(e))
              .toList() ?? [],
      freviewTourisms: (json['freviewTourisms'] as List<dynamic>?)
              ?.map((e) => HiveTourismModel.fromJson(e))
              .toList() ?? [],
      reviewTours: (json['reviewTours'] as List<dynamic>?)
              ?.map((e) => HiveTourModel.fromJson(e))
              .toList() ?? [],
      reviewHotels: (json['reviewHotels'] as List<dynamic>?)
              ?.map((e) => HiveHotelModel.fromJson(e))
              .toList() ?? [],
      reviewCars: (json['reviewCars'] as List<dynamic>?)
              ?.map((e) => HiveCarModel.fromJson(e))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'nationality': nationality,
      'birthday': birthday,
      'favouritesTourisms': favouritesTourisms.map((e) => e.toJson()).toList(),
      'favouriteTours': favouriteTours.map((e) => e.toJson()).toList(),
      'favouriteHotels': favouriteHotels.map((e) => e.toJson()).toList(),
      'favouriteCars': favouriteCars.map((e) => e.toJson()).toList(),
      'freviewTourisms': freviewTourisms.map((e) => e.toJson()).toList(),
      'reviewTours': reviewTours.map((e) => e.toJson()).toList(),
      'reviewHotels': reviewHotels.map((e) => e.toJson()).toList(),
      'reviewCars': reviewCars.map((e) => e.toJson()).toList(),
    };
  }
}
