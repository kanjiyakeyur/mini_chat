
class ChatModel {
  final int? id;
  final String? body;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      body: json['body'],
    );
  }

  ChatModel({
    this.id,
    this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
    };
  }

  bool isAuthor() {
    return (id??1) % 2 == 0;
  }
}