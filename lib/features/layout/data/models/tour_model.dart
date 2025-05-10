import 'package:hive/hive.dart';
import 'review_model.dart'; // Must be a Hive type

part 'tour_model.g.dart';

@HiveType(typeId: 5) // Make sure the typeId is unique
class TourModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  int days;

  @HiveField(4)
  int people;

  @HiveField(5)
  String price;

  @HiveField(6)
  String location;

  @HiveField(7)
  String hostName;

  @HiveField(8)
  String phone;

  @HiveField(9)
  double rating;

  @HiveField(10)
  String imageUrl;

  @HiveField(11)
  List<ReviewModel> reviews;

  TourModel({
    required this.id,
    required this.name,
    required this.description,
    required this.days,
    required this.people,
    required this.price,
    required this.location,
    required this.hostName,
    required this.phone,
    required this.rating,
    required this.imageUrl,
    required this.reviews,
  });

  // From JSON to TourModel
  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      days: json['days'],
      people: json['people'],
      price: json['price'],
      location: json['location'],
      hostName: json['hostName'],
      phone: json['phone'],
      rating: json['rating'],
      imageUrl: json['imageUrl'],
      reviews: (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList(),
    );
  }

  // From TourModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'days': days,
      'people': people,
      'price': price,
      'location': location,
      'hostName': hostName,
      'phone': phone,
      'rating': rating,
      'imageUrl': imageUrl,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
