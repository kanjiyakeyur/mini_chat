class UserModel {
  final String? id;
  final String? name;
  final bool? isOnline;
  final String? lastSeen;
  final String? lastMessage;
  final int? unreadMessageCount;

  UserModel({
    this.id,
    this.name,
    this.isOnline,
    this.lastSeen,
    this.lastMessage,
    this.unreadMessageCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      isOnline: json['isOnline'],
      lastSeen: json['lastSeen'],
      lastMessage: json['lastMessage'],
      unreadMessageCount: json['unreadMessageCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isOnline': isOnline,
      'lastSeen': lastSeen,
      'lastMessage': lastMessage,
      'unreadMessageCount': unreadMessageCount,
    };
  }
}
