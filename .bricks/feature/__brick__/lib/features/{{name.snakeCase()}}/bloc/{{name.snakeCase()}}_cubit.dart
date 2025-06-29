import 'dart:async';

import 'package:prize/core/error/failure.dart';
import 'package:prize/core/utils/enums/request_status.dart';
import 'package:prize/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/repo/{{name.snakeCase()}}_repo.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  final {{name.pascalCase()}}Repo _{{name.camelCase()}}Repo;

  {{name.pascalCase()}}Cubit(this._{{name.camelCase()}}Repo) : super(const {{name.pascalCase()}}State());

  {{#is_list}}FutureOr<void> get{{name.pascalCase()}}s() async {
    emit(state.copyWith({{name.camelCase()}}Status: RequestStatus.loading));

    final result = await _{{name.camelCase()}}Repo.get{{name.pascalCase()}}s();

    emit(
      result.fold(
        (l) => state.copyWith({{name.camelCase()}}Status: RequestStatus.error, {{name.camelCase()}}Failure: l),
        (r) => state.copyWith({{name.camelCase()}}Status: RequestStatus.success, {{name.camelCase()}}s: r),
      ),
    );
  }{{/is_list}}{{^is_list}}FutureOr<void> get{{name.pascalCase()}}() async {
    emit(state.copyWith({{name.camelCase()}}Status: RequestStatus.loading));

    final result = await _{{name.camelCase()}}Repo.get{{name.pascalCase()}}();

    emit(
      result.fold(
        (l) => state.copyWith({{name.camelCase()}}Status: RequestStatus.error, {{name.camelCase()}}Failure: l),
        (r) => state.copyWith({{name.camelCase()}}Status: RequestStatus.success, {{name.camelCase()}}: r),
      ),
    );
  }{{/is_list}}

}
