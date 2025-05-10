import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_car_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tour_model.dart';
import 'package:egy_tour/features/layout/data/models/hive_tourism_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';

class FirebaseUserModel {
  String cover;
  String image;
  final String email;
  String name;
  String bio;
  String phone;
  String country;
  String city;
  String nationality;
  String birthday;
  List<String> photos;

  List<TourismModel> favouritesTourisms;
  List<TourModel> favouriteTours;
  List<HotelModel> favouriteHotels;
  List<CarModel> favouriteCars;

  List<HiveTourismModel> freviewTourisms;
  List<HiveTourModel> reviewTours;
  List<HiveHotelModel> reviewHotels;
  List<HiveCarModel> reviewCars;

  FirebaseUserModel({
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
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

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      bio: json["bio"] ?? '',
      cover: json["cover"] ?? '',
      photos: List<String>.from(json['photos'] ?? []),
      nationality: json['nationality'] ?? '',
      birthday: json['birthday'] ?? '',

      favouritesTourisms: (json['favouritesTourisms'] as List<dynamic>? ?? [])
          .map((e) => TourismModel.fromJson(e))
          .toList(),
      favouriteTours: (json['favouriteTours'] as List<dynamic>? ?? [])
          .map((e) => TourModel.fromJson(e))
          .toList(),
      favouriteHotels: (json['favouriteHotels'] as List<dynamic>? ?? [])
          .map((e) => HotelModel.fromJson(e))
          .toList(),
      favouriteCars: (json['favouriteCars'] as List<dynamic>? ?? [])
          .map((e) => CarModel.fromJson(e))
          .toList(),

      freviewTourisms: (json['freviewTourisms'] as List<dynamic>? ?? [])
          .map((e) => HiveTourismModel.fromJson(e))
          .toList(),
      reviewTours: (json['reviewTours'] as List<dynamic>? ?? [])
          .map((e) => HiveTourModel.fromJson(e))
          .toList(),
      reviewHotels: (json['reviewHotels'] as List<dynamic>? ?? [])
          .map((e) => HiveHotelModel.fromJson(e))
          .toList(),
      reviewCars: (json['reviewCars'] as List<dynamic>? ?? [])
          .map((e) => HiveCarModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
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
