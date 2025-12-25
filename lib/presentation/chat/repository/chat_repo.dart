import 'package:mini_chat/domain/api_client.dart';
import 'package:mini_chat/domain/api_urls.dart';
import 'package:mini_chat/domain/app_exceptions.dart';
import 'package:mini_chat/domain/either.dart';

import '../model/api_response_model.dart';

class ChatApiRepository {
  final ApiClient apiClient = ApiClient();

  static ChatApiRepository? _instance;

  factory ChatApiRepository() {
    _instance ??= ChatApiRepository._internal();
    return _instance!;
  }

  ChatApiRepository._internal();

  Future<Either<AppException, MockApiResponseModel?>>
  getWeeklySentiment() async {
    final either = await apiClient.get('${ApiUrls.comments}?limit=10');

    return either.fold((error) => Left(error), (res) {
      try {
        return Right(
          (res.responseData == null)
              ? null
              : MockApiResponseModel.fromJson(res.responseData),
        );
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to parse weekly sentiment data: ${e.toString()}',
            statusCode: 0,
            identifier: 'model_parser_error',
          ),
        );
      }
    });
  }
}
