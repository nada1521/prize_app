import 'dart:async';
import 'package:prize/core/network/api_constants.dart';
import 'package:prize/core/network/interceptor/app_interceptor.dart';
import 'package:prize/core/network/interceptor/logging_interceptor.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:requests_inspector/requests_inspector.dart' show RequestsInspectorInterceptor;

class DioFactory {
  DioFactory._();

  static late Dio dio;

  static Future<Dio> initDio() async {
    const timeOut = Duration(seconds: 30);

    dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
      // ..options.validateStatus = (status) {
      //   return true;
      // };

    _setupInterceptors();
    await _setupHeaders();

    return dio;
  }

  static void updateTokenInHeaders(String? token) {
    if (token?.isNotEmpty == true) {
      dio.options.headers['Authorization'] = "Bearer $token";
    } else {
      dio.options.headers.remove('Authorization');
    }
  }

  static Future<void> _setupHeaders() async {
    dio.options.headers['Accept'] = "application/json";
    final token = await CacheHelper.getSecuredString(AppStrings.token);
    updateTokenInHeaders(token);
  }

  static void _setupInterceptors() {
    dio.interceptors.add(AppInterceptor());

    if (kDebugMode) {
      // For show API logs
      dio.interceptors.add(LoggingInterceptor());
      // For Request Inspector package
      dio.interceptors.add(RequestsInspectorInterceptor());
    }
  }
}
