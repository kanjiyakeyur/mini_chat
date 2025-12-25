
class ChatModel {
  final int? id;
  final String? body;
  final DateTime? createdAt;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      body: json['body'],
      createdAt: DateTime.now(),
    );
  }

  ChatModel({
    this.id,
    this.body,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  bool isAuthor() {
    return (id??1) % 2 == 0;
  }
}