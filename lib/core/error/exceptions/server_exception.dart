import 'package:prize/core/network/error_handling/api_error_handler.dart';
import 'package:prize/core/network/error_handling/api_error_model.dart';
import 'package:dio/dio.dart';

/// Use [ServerException] to:
/// - Throw an [Exception] in a [DataSource].
///
/// - Catch the [Exception] in a [Repository].
class ServerException implements Exception {
  final ApiErrorModel error;

  ServerException({required this.error});

  factory ServerException.handle(dynamic e) {
    return ServerException(error: ApiErrorHandler.handle(e));
  }

  factory ServerException.fromResponse(Response response) {
    return ServerException(error: ApiErrorHandler.handle(response));
  }
}
