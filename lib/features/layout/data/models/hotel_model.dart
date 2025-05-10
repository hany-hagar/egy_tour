import 'package:hive/hive.dart';
import 'review_model.dart'; // Ensure ReviewModel is Hive-compatible

part 'hotel_model.g.dart';

@HiveType(typeId: 4)
class HotelModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String address;

  @HiveField(3)
  double rating;

  @HiveField(4)
  int reviewCount;

  @HiveField(5)
  double pricePerNight;

  @HiveField(6)
  String roomType;

  @HiveField(7)
  String checkInTime;

  @HiveField(8)
  String checkOutTime;

  @HiveField(9)
  String description;

  @HiveField(10)
  List<String> amenities;

  @HiveField(11)
  List<String> roomImages;

  @HiveField(12)
  List<String> policies;

  @HiveField(13)
  List<ReviewModel> reviews;

  HotelModel({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.roomType,
    required this.checkInTime,
    required this.checkOutTime,
    required this.description,
    required this.amenities,
    required this.roomImages,
    required this.policies,
    required this.reviews,
  });

  // From JSON to HotelModel
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      pricePerNight: json['pricePerNight'],
      roomType: json['roomType'],
      checkInTime: json['checkInTime'],
      checkOutTime: json['checkOutTime'],
      description: json['description'],
      amenities: List<String>.from(json['amenities'] ?? []),
      roomImages: List<String>.from(json['roomImages'] ?? []),
      policies: List<String>.from(json['policies'] ?? []),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
    );
  }

  // From HotelModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'rating': rating,
      'reviewCount': reviewCount,
      'pricePerNight': pricePerNight,
      'roomType': roomType,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'description': description,
      'amenities': amenities,
      'roomImages': roomImages,
      'policies': policies,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
