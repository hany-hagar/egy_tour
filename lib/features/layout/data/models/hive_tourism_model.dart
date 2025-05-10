import 'package:hive/hive.dart';
import 'tourism_model.dart'; // Ensure this includes fromJson & toJson methods

part 'hive_tourism_model.g.dart';

@HiveType(typeId: 11)
class HiveTourismModel extends HiveObject {
  @HiveField(0)
  int reviewIndex;

  @HiveField(1)
  TourismModel model;

  HiveTourismModel({
    required this.reviewIndex,
    required this.model,
  });

  // ✅ fromJson factory constructor
  factory HiveTourismModel.fromJson(Map<String, dynamic> json) {
    return HiveTourismModel(
      reviewIndex: json['love'] ?? 0,
      model: TourismModel.fromJson(json['model'] ?? {}),
    );
  }

  // ✅ toJson method
  Map<String, dynamic> toJson() {
    return {
      'love': reviewIndex,
      'model': model.toJson(),
    };
  }
}
