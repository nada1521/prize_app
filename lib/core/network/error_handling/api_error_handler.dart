// ignore_for_file: empty_catches

import 'dart:developer';
import 'package:prize/core/network/error_handling/api_error_model.dart';
import 'package:prize/core/routing/app_router.dart';
import 'package:prize/core/routing/routers.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
import 'package:prize/core/utils/helper/navigation/push_named_and_finish.dart';
import 'package:prize/core/widgets/main/snk_bar.dart';

/// Handling the error here and return a final result of error and parse to
/// final responseModel.error
///
/// Written by: [MAlazhariy]
abstract class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    debugPrint('❌ Error occurred: $error');
    switch (error) {
      case Response _:
        return _onResponse(error);
      case Exception _:
        return _onException(error);
      case String _:
        return ApiErrorModel(error);
      default:
        return _defaultErrorMessage(error);
    }
  }
}

ApiErrorModel _defaultErrorMessage(dynamic e) {
  return ApiErrorModel("${LocaleKeys.common_errors_error_occurred.tr()}\n$e");
}

ApiErrorModel _onException(Exception error) {
  try {
    if (error is DioException) {
      return _onDioException(error);
    } else {
      return ApiErrorModel("$error");
    }
  } on FormatException catch (e) {
    return _defaultErrorMessage(e);
  }
}

ApiErrorModel _onResponse(Response response) {
  ApiErrorModel? errorResponse;
  try {
    errorResponse = ApiErrorModel.fromJson(
      response.data,
      code: response.statusCode,
    );
  } catch (e) {}
  final responseData =
      response.data.toString().contains('<!DOCTYPE html>') == true ? "<HTML content>" : response.data.toString().replaceAll('\n', ' ');
  debugPrint('<-- ❌ [${response.requestOptions.path}] (${response.statusCode}) $responseData');
  debugPrint('--- status message: ${response.statusMessage}');

  if (errorResponse == null) {
    return ApiErrorModel("${response.statusCode}: ${LocaleKeys.common_errors_error_occurred.tr()}");
  } else {
    return errorResponse;
  }
}

ApiErrorModel _onDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ApiErrorModel(LocaleKeys.common_errors_connection_timeout_error.tr());
    case DioExceptionType.sendTimeout:
      return ApiErrorModel(LocaleKeys.common_errors_send_timeout_error.tr());
    case DioExceptionType.receiveTimeout:
      return ApiErrorModel(LocaleKeys.common_errors_receive_timeout_error.tr());
    case DioExceptionType.cancel:
      return ApiErrorModel(LocaleKeys.common_errors_error_request_canceled.tr());
    case DioExceptionType.connectionError:
      return ApiErrorModel(LocaleKeys.common_errors_connection_failed_check_internet.tr());
    case DioExceptionType.badCertificate:
      return ApiErrorModel(LocaleKeys.common_errors_bad_certificate_error.tr());
    case DioExceptionType.unknown:
      debugPrint("❌ Dio Unknown error (Maybe modeling issue): ${e.error}");
      // return _onBadResponse(e.response);
      return ApiErrorModel(LocaleKeys.common_errors_unexpected_error_occurred.tr());
    case DioExceptionType.badResponse:
      return _onBadResponse(e.response);
  }
}

ApiErrorModel _onBadResponse(Response? response) {
  if (response?.statusCode == 401) {
    return _onStatus401();
  }

  final code = response?.statusCode;
  final message = response?.data is Map
      ? (response?.data?['message'] ?? response?.data?['error'] ?? response?.statusMessage ?? LocaleKeys.common_errors_error_occurred.tr())
      : response?.statusMessage;

  ApiErrorModel? errorResponse;
  try {
    errorResponse = ApiErrorModel(
      message,
      code: code!,
    );
  } catch (_) {}

  final responseData =
      response?.data.toString().contains('<!DOCTYPE html>') == true ? "<HTML content>" : response?.data.toString().replaceAll('\n', ' ');
  debugPrint('<-- ❌ Bad response: [${response?.requestOptions.path}] ($code) $responseData');
  debugPrint('-- error message: $message');

  if (errorResponse == null) {
    return ApiErrorModel("$code: $message");
  } else {
    return errorResponse;
  }
}

ApiErrorModel _onStatus401() {
  // clear profile data
  // NavigatorManager.getContext().read<ProfileCubit>().clearProfile();
  // // logout from the app
  // NavigatorManager.getContext().read<AuthCubit>().logout();
  // show SnackBar message
  SnkBar.showError(LocaleKeys.auth_message_login_again.tr(), milliseconds: 2500);
  // navigate to Login screen
  pushNamedAndFinish(NavigatorManager.getContext(), AppRoutes.login);
  log('⚠️ LOGIN AGAIN requested!');
  return ApiErrorModel(LocaleKeys.auth_message_login_again.tr());
}
