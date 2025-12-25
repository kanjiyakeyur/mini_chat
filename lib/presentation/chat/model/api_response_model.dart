

import 'package:mini_chat/data/user_model.dart';

class MockApiResponseModel {
  final List<UserModel>? comments;
  final int? total;
  final int? skip;
  final int? limit;

  MockApiResponseModel({
    this.comments,
    this.total,
    this.skip,
    this.limit,
  });

  factory MockApiResponseModel.fromJson(Map<String, dynamic> json) {
    return MockApiResponseModel(
      comments: List<UserModel>.from(json['comments'].map((x) => UserModel.fromJson(x))),
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