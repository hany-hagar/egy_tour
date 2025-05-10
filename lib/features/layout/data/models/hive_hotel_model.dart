import 'package:hive/hive.dart';
import 'hotel_model.dart'; // Ensure HotelModel is Hive-compatible

part 'hive_hotel_model.g.dart';

@HiveType(typeId: 9) // Ensure a unique typeId
class HiveHotelModel extends HiveObject {
  @HiveField(0)
  int reviewIndex;

  @HiveField(1)
  HotelModel model;

  HiveHotelModel({
    required this.reviewIndex,
    required this.model,
  });

  // From JSON to HiveHotelModel
  factory HiveHotelModel.fromJson(Map<String, dynamic> json) {
    return HiveHotelModel(
      reviewIndex: json['love'],
      model: HotelModel.fromJson(json['model']),  // Ensure HotelModel has fromJson method
    );
  }

  // From HiveHotelModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'love': reviewIndex,
      'model': model.toJson(),  // Ensure HotelModel has toJson method
    };
  }
}
