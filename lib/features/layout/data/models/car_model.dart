import 'package:hive/hive.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart'; // Ensure ReviewModel is compatible
part 'car_model.g.dart';

@HiveType(typeId: 7) // Make sure typeId is unique across your app
class CarModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String imageUrl;

  @HiveField(2)
  String description;

  @HiveField(3)
  double likes;

  @HiveField(4)
  String location;

  @HiveField(5)
  String carNumber;

  @HiveField(6)
  String name;

  @HiveField(7)
  String company;

  @HiveField(8)
  String phone;

  @HiveField(9)
  String price;

  @HiveField(10)
  String model;

  @HiveField(11)
  List<ReviewModel> reviews;

  CarModel({
    required this.carNumber,
    required this.name,
    required this.company,
    required this.phone,
    required this.price,
    required this.model,
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.location,
    required this.reviews,
  });

  // From JSON to CarModel
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      likes: json['likes'],
      location: json['location'],
      carNumber: json['carNumber'],
      name: json['name'],
      company: json['company'],
      phone: json['phone'],
      price: json['price'],
      model: json['model'],
      reviews: (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList(),
    );
  }

  // From CarModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'description': description,
      'likes': likes,
      'location': location,
      'carNumber': carNumber,
      'name': name,
      'company': company,
      'phone': phone,
      'price': price,
      'model': model,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
