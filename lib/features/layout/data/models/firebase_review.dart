import 'package:egy_tour/features/layout/data/models/review_model.dart';

class MainModel {
  final String type;
  final ReviewModel review;

  MainModel({
    required this.type,
    required this.review,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      type: json['type'],
      review: ReviewModel.fromJson(json['review']),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'review': review.toJson(),
      };
}
