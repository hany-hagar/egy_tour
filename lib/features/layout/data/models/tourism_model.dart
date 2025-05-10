import 'package:hive/hive.dart';
import 'review_model.dart'; // Make sure ReviewModel is Hive-compatible too

part 'tourism_model.g.dart';

@HiveType(typeId: 6) // Use a unique typeId
class TourismModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String location;

  @HiveField(3)
  double rating;

  @HiveField(4)
  int numberOfRatings;

  @HiveField(5)
  String openTime;

  @HiveField(6)
  String price;

  @HiveField(7)
  String description;

  @HiveField(8)
  List<String> facilities;

  @HiveField(9)
  List<String> images;

  @HiveField(10)
  List<ReviewModel> reviews;

  TourismModel({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.numberOfRatings,
    required this.openTime,
    required this.price,
    required this.description,
    required this.facilities,
    required this.images,
    required this.reviews,
  });

  // From JSON to TourismModel
  factory TourismModel.fromJson(Map<String, dynamic> json) {
    return TourismModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      rating: json['rating'],
      numberOfRatings: json['numberOfRatings'],
      openTime: json['openTime'],
      price: json['price'],
      description: json['description'],
      facilities: List<String>.from(json['facilities']),
      images: List<String>.from(json['images']),
      reviews: (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList(),
    );
  }

  // From TourismModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'rating': rating,
      'numberOfRatings': numberOfRatings,
      'openTime': openTime,
      'price': price,
      'description': description,
      'facilities': facilities,
      'images': images,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
