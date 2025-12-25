import 'package:mini_chat/presentation/chat/model/chat_model.dart';

class MockApiResponseModel {
  final List<ChatModel>? comments;
  final int? total;
  final int? skip;
  final int? limit;

  MockApiResponseModel({this.comments, this.total, this.skip, this.limit});

  factory MockApiResponseModel.fromJson(Map<String, dynamic> json) {
    return MockApiResponseModel(
      comments: List<ChatModel>.from(
        json['comments'].map((x) => ChatModel.fromJson(x)),
      ),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comments': List<dynamic>.from(comments!.map((x) => x.toJson())),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}
