class MsgModel {
  final String message;
  final String from;
  final String type;

  MsgModel({
    required this.message,
    required this.from,
    required this.type,
  });

  /// Factory constructor to create an instance from JSON (Map)
  factory MsgModel.fromJson(Map<String, dynamic> json) {
    return MsgModel(
      message: json['message'],
      from: json['from'],
      type: json['type'],
    );
  }

  /// To JSON format
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'from': from,
      'type': type,
    };
  }
}
