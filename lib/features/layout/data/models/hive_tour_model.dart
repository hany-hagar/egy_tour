import 'package:hive/hive.dart';
import 'tour_model.dart'; // Ensure this is Hive-compatible

part 'hive_tour_model.g.dart';

@HiveType(typeId: 8) // Use a unique typeId
class HiveTourModel extends HiveObject {
  @HiveField(0)
  int reviewIndex;

  @HiveField(1)
  TourModel model;

  HiveTourModel({
    required this.reviewIndex,
    required this.model,
  });

  // From JSON to HiveTourModel
  factory HiveTourModel.fromJson(Map<String, dynamic> json) {
    return HiveTourModel(
      reviewIndex: json['love'],
      model: TourModel.fromJson(json['model']),  // Ensure TourModel has fromJson method
    );
  }

  // From HiveTourModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'love': reviewIndex,
      'model': model.toJson(),  // Ensure TourModel has toJson method
    };
  }
}
