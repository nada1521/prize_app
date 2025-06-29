import 'package:dio/dio.dart';


class AppInterceptor extends Interceptor {
  // final BaseLoginLocalDataSource loginLocalDataSource;
  // final Dio dio;
  //
  // AppInterceptor(this.loginLocalDataSource, this.dio);
  //
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   super.onRequest(options, handler);
  // }

// @override
// void onResponse(Response response, ResponseInterceptorHandler handler) async {
//   if (response.isUnauthorized && response.requestOptions.path != AppConstants.REFRESH_TOKEN) {
//     return await _onUnauthorized(response, handler);
//   }
//   return super.onResponse(response, handler);
// }
//
// Future<String?> _refreshToken(Response response) async {
//   final response = await dio.post(
//     AppConstants.REFRESH_TOKEN,
//   );
//
//   String? token = response.data is Map ? response.data?['data']?['token'] : null;
//   if (token != null) {
//     token = 'Bearer $token';
//     debugPrint('refreshToken done -> $token');
//     loginLocalDataSource.saveToken(token);
//     sl<ApiClient<Response>>().updateToken(token);
//     response.requestOptions.headers['Authorization'] = token;
//     return token;
//   }
//
//   return token;
// }
//
// Future<void> _onUnauthorized(Response response, ResponseInterceptorHandler handler) async {
//   final authBloc = navigatorKey.currentContext!.read<AuthBloc>();
//   final isAuth = authBloc.state.status.isAuthenticated;
//
//   if (isAuth) {
//     log('⚠️ UNAUTHORIZED!! -> ${response.requestOptions.path}');
//     final token = await _refreshToken(response);
//     if (token != null) {
//       final r = await _retry(response.requestOptions, token);
//       return handler.resolve(r);
//     } else {
//       _rejectResponse(response, handler);
//     }
//   } else {
//     handler.next(response);
//   }
// }
//
// void _rejectResponse(Response response, ResponseInterceptorHandler handler) {
//   debugPrint('> reject response -> ${response.requestOptions.path}');
//   return handler.next(response);
//   // return handler.reject(
//   //   DioException.badResponse(
//   //     statusCode: 401,
//   //     requestOptions: response.requestOptions,
//   //     response: response,
//   //   ),
//   // );
// }
//
// Future<Response> _retry(RequestOptions requestOptions, String token) async {
//   requestOptions.headers['Authorization'] = token;
//   final options = Options(
//     method: requestOptions.method,
//     headers: requestOptions.headers,
//   );
//
//   return await dio.request<dynamic>(
//     requestOptions.path,
//     data: requestOptions.data,
//     queryParameters: requestOptions.queryParameters,
//     options: options,
//   );
// }
}
