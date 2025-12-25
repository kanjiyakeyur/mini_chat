import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_response.dart';
import 'api_urls.dart';
import 'app_exceptions.dart';
import 'either.dart';
import 'exception_handler_mixin.dart';
import 'network_service.dart';


typedef ApiClientException = DioException;
typedef ApiClientResponse<T> = Response<T>;
typedef ApiClientRequestOptions = RequestOptions;
// typedef _ResponseData = Map<String, Object?>;

extension ApiClientExceptionX on ApiClientException {
  String? get responseMessage {
    final data = response?.data;

    if (data is! Map) return null;

    return (response?.data as Map?)?['message'] as String?;
  }
}

/// An API client that makes network requests.
///
/// This class is meant to be seen as a
/// representation of the common API contract
/// or API list (such as Swagger or Postman) given by the backend.
///
/// This class does not maintain authentication state,
/// but rather receive the token
/// from external source.
///
/// When a widget or provider wants to make a network request, it should not
/// instantiate this class, but instead call the provider that exposes an object
/// of this type.
class ApiClient extends NetworkService with ExceptionHandlerMixin {
  final Dio _httpClient;

  static final ApiClient _singleton = ApiClient._internal();

  // Flag to prevent multiple concurrent logout operations
  static bool _isLoggingOut = false;

  factory ApiClient({Future<void> Function()? handleUnauthorized}) {
    return _singleton;
  }

  ApiClient._internal() : _httpClient = Dio(_defaultOptions)..interceptors.addAll([
    // AuthInterceptor(),
    // Logging interceptor - only active in debug mode when ApiLogger.enableLogging is true
    // if (kDebugMode) LoggingInterceptor(),
  ]);

  /// Set the logout flag to prevent duplicate logout operations
  static void setLoggingOutFlag() {
    _isLoggingOut = true;
  }

  /// Reset the logout flag (call this after logout completes)
  static void resetLogoutFlag() {
    _isLoggingOut = false;
  }

  /// Handle 401 unauthorized by triggering logout through UserBloc
  Future<void> _handleUnauthorized() async {
    // Prevent triggering logout if already logging out
    if (_isLoggingOut) {
      log('Logout already in progress, skipping duplicate logout trigger');
      return;
    }

    try {
      _isLoggingOut = true;
      print("auto logout");
    } catch (e) {
      _isLoggingOut = false;
      log('Error handling unauthorized: $e');
    }
  }

  static final BaseOptions _defaultOptions = BaseOptions(
    baseUrl: ApiUrls.baseUrl,
  );

  @override
  String toString() {
    return 'ApiClient(baseUrl: ${_httpClient.options.baseUrl}, '
        ' _httpClient.options.headers["Authorization"]:'
        ' ${_httpClient.options.headers['Authorization']})';
  }

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    _httpClient.options.headers = header;

    return header;
  }

  @override
  Future<Either<AppException, ApiResponse>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool logDetails = false,
  }) async {
    if (logDetails) {
      log('Endpoint: $endpoint');
      log('Body: $body');
      log('Headers: ${_httpClient.options.headers}');
    }
    final res = await handleException(
      () => _httpClient.post(endpoint, data: body),
      endpoint: endpoint,
      handleUnauthorized: _handleUnauthorized,
      // refreshToken: refreshToken,
    );
    return res;
  }

  @override
  Future<Either<AppException, ApiResponse>> get(
    String endpoint, {
    Map<String, dynamic>? params,
    bool logDetails = false,
  }) async {
    if (logDetails) {
      log('Endpoint: $endpoint');
      log('Headers: ${_httpClient.options.headers}');
    }
    final res = await handleException(
      () => _httpClient.get(endpoint, queryParameters: params),
      endpoint: endpoint,
      handleUnauthorized: _handleUnauthorized,
      // refreshToken: refreshToken,
    );
    return res;
  }

  @override
  Future<Either<AppException, ApiResponse>> delete(
    String endpoint, {
    Map<String, dynamic>? params,
    bool logDetails = false,
  }) async {
    if (logDetails) {
      log('Endpoint: $endpoint');
      log('Headers: ${_httpClient.options.headers}');
    }
    final res = await handleException(
      () => _httpClient.delete(endpoint, queryParameters: params),
      endpoint: endpoint,
      handleUnauthorized: _handleUnauthorized,
      // refreshToken: refreshToken,
    );
    return res;
  }

  @override
  Future<Either<AppException, ApiResponse>> put(
      String endpoint, {
        Map<String, dynamic>? body,
        bool logDetails = false,
      }) async {
    if (logDetails) {
      log('Endpoint: $endpoint');
      log('Body: $body');
      log('Headers: ${_httpClient.options.headers}');
    }
    final res = await handleException(
          () => _httpClient.put(endpoint, data: body),
      endpoint: endpoint,
      handleUnauthorized: _handleUnauthorized,
      // refreshToken: refreshToken,
    );
    return res;
  }

  @override
  Future<Either<AppException, ApiResponse>> patch(
    String endpoint, {
    Map<String, dynamic>? params,
    bool logDetails = false,
  }) async {
    if (logDetails) {
      log('Endpoint: $endpoint');
      log('Body: $params');
      log('Headers: ${_httpClient.options.headers}');
    }
    final res = await handleException(
      () => _httpClient.patch(endpoint, data: params),
      endpoint: endpoint,
      handleUnauthorized: _handleUnauthorized,
      // refreshToken: refreshToken,
    );
    return res;
  }

}
