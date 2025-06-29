import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("--> ${options.method} ${options.path} (${options.baseUrl.split('/').last})");
    debugPrint("Headers: ${options.headers}");
    debugPrint("parameters: ${options.queryParameters}");
    if (options.data != null) {
      debugPrint("body data: ${options.data}");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("<-- [${response.data is Map ? (response.data?['code'] ?? response.statusCode) : response.statusCode}] ${response.requestOptions.path}");
    debugPrint("${response.data}".replaceAll('\n', ' '));
    debugPrint("-----");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("!!! Dio ERROR [${err.response?.statusCode}] => full path: ${err.requestOptions.baseUrl}${err.requestOptions.path}");
    debugPrint("error message: ${err.message}");
    return super.onError(err, handler);
  }
}
