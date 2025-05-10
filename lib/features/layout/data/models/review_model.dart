import 'package:hive/hive.dart';

part 'review_model.g.dart'; // This part file will be generated after running the build command

@HiveType(typeId: 12) // Ensure the typeId is unique across your app
class ReviewModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final String? userAvatar;

  @HiveField(4)
  final int rating;

  @HiveField(5)
  final String? title;

  @HiveField(6)
  final String comment;

  @HiveField(7)
  final DateTime date;

  @HiveField(8)
  final int? helpfulVotes;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatar,
    required this.rating,
    this.title,
    required this.comment,
    required this.date,
    this.helpfulVotes,
  });

  // From JSON to ReviewModel
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      rating: json['rating'] ?? 0,
      title: json['title'],
      comment: json['comment'] ?? '',
      date: DateTime.parse(json['date']),
      helpfulVotes: json['helpfulVotes'],
    );
  }

  // From ReviewModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userAvatar': userAvatar,
      'rating': rating,
      'title': title,
      'comment': comment,
      'date': date.toIso8601String(),
      'helpfulVotes': helpfulVotes,
    };
  }
}
