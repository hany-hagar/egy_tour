import 'package:hive/hive.dart';
import 'car_model.dart'; // Ensure CarModel is Hive-compatible

part 'hive_car_model.g.dart';

@HiveType(typeId: 10) // Use a unique typeId
class HiveCarModel extends HiveObject {
  @HiveField(0)
  int reviewIndex;

  @HiveField(1)
  CarModel model;

  HiveCarModel({
    required this.reviewIndex,
    required this.model,
  });

  // From JSON to HiveCarModel
  factory HiveCarModel.fromJson(Map<String, dynamic> json) {
    return HiveCarModel(
      reviewIndex: json['love'],
      model: CarModel.fromJson(json['model']),
    );
  }

  // From HiveCarModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'love': reviewIndex,
      'model': model.toJson(), // Assuming CarModel has a toJson method
    };
  }
}
