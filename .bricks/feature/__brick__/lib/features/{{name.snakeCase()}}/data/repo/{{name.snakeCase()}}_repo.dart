import 'package:prize/core/network/api_repo_handler.dart';
import 'package:prize/core/utils/common/future_result_of_typedef.dart';
import '../data_source/{{name.snakeCase()}}_api_service.dart';
import '../models/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Repo {
  final {{name.pascalCase()}}ApiService _{{name.camelCase()}}ApiService;

  const {{name.pascalCase()}}Repo(this._{{name.camelCase()}}ApiService);
  {{#is_list}}
  FutureResultOf<List<{{name.pascalCase()}}Model>> get{{name.pascalCase()}}s() async {
    return ApiRepoHandler.execute(() async => await _{{name.camelCase()}}ApiService.get{{name.pascalCase()}}s());
  }{{/is_list}}{{^is_list}}
  FutureResultOf<{{name.pascalCase()}}Model> get{{name.pascalCase()}}() async {
    return ApiRepoHandler.execute(() async => await _{{name.camelCase()}}ApiService.get{{name.pascalCase()}}());
  }{{/is_list}}
}
