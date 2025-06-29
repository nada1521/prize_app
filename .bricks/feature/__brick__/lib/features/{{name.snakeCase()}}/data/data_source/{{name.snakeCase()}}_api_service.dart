import 'package:prize/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/{{name.snakeCase()}}_model.dart';

part '{{name.snakeCase()}}_api_service.g.dart';

@RestApi()
abstract class {{name.pascalCase()}}ApiService {
  factory {{name.pascalCase()}}ApiService(Dio dio) = _{{name.pascalCase()}}ApiService;
  {{#is_list}}
  @GET(ApiConstants.get{{name.pascalCase()}}s)
  Future<List<{{name.pascalCase()}}Model>> get{{name.pascalCase()}}s();{{/is_list}}{{^is_list}}
  @GET(ApiConstants.get{{name.pascalCase()}})
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}();{{/is_list}}

}
