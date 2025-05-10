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
  final String country;
  @HiveField(7)
  final String city;
  @HiveField(8)
  final String bio;
  @HiveField(9)
  final String cover;
  @HiveField(10)
  final List<String> photos;
  @HiveField(11)
  final String nationality;
  @HiveField(12)
  final String birthday;

  @HiveField(13)
  List<TourismModel> favouritesTourisms;
  @HiveField(14)
  List<TourModel> favouriteTours;
  @HiveField(15)
  List<HotelModel> favouriteHotels;
  @HiveField(16)
  List<CarModel> favouriteCars;
  @HiveField(17)
  List<HiveTourismModel> freviewTourisms;
  @HiveField(18)
  List<HiveTourModel> reviewTours;
  @HiveField(19)
  List<HiveHotelModel> reviewHotels;
  @HiveField(20)
  List<HiveCarModel> reviewCars;

  HiveUserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.country,
    required this.city,
    required this.bio,
    required this.cover,
    required this.photos,
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
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      bio: json['bio'] ?? '',
      cover: json['cover'] ?? '',
      photos: List<String>.from(json['photos'] ?? []),
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
      'country': country,
      'city': city,
      'bio': bio,
      'cover': cover,
      'photos': photos,
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
