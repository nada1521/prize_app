part of '{{name.snakeCase()}}_cubit.dart';

class {{name.pascalCase()}}State extends Equatable {
  // {{name.pascalCase()}}
{{#is_list}}  final RequestStatus {{name.camelCase()}}Status;
  final List<{{name.pascalCase()}}Model> {{name.camelCase()}}s;
  final Failure? {{name.camelCase()}}Failure;

  const {{name.pascalCase()}}State({
    this.{{name.camelCase()}}Status = RequestStatus.init,
    this.{{name.camelCase()}}s = const [],
    this.{{name.camelCase()}}Failure,
  });

  {{name.pascalCase()}}State copyWith({
    RequestStatus? {{name.camelCase()}}Status,
    List<{{name.pascalCase()}}Model>? {{name.camelCase()}}s,
    Failure? {{name.camelCase()}}Failure,
  }) {
    return {{name.pascalCase()}}State(
      {{name.camelCase()}}Status: {{name.camelCase()}}Status ?? this.{{name.camelCase()}}Status,
      {{name.camelCase()}}s: {{name.camelCase()}}s ?? this.{{name.camelCase()}}s,
      {{name.camelCase()}}Failure: {{name.camelCase()}}Failure ?? this.{{name.camelCase()}}Failure,
    );
  }

  @override
  List<Object?> get props => [{{name.camelCase()}}Status, {{name.camelCase()}}s, {{name.camelCase()}}Failure];{{/is_list}}{{^is_list}}  final RequestStatus {{name.camelCase()}}Status;
  final {{name.pascalCase()}}Model? {{name.camelCase()}};
  final Failure? {{name.camelCase()}}Failure;

  const {{name.pascalCase()}}State({
    this.{{name.camelCase()}}Status = RequestStatus.init,
    this.{{name.camelCase()}},
    this.{{name.camelCase()}}Failure,
  });

  {{name.pascalCase()}}State copyWith({
    RequestStatus? {{name.camelCase()}}Status,
    {{name.pascalCase()}}Model? {{name.camelCase()}},
    Failure? {{name.camelCase()}}Failure,
  }) {
    return {{name.pascalCase()}}State(
      {{name.camelCase()}}Status: {{name.camelCase()}}Status ?? this.{{name.camelCase()}}Status,
      {{name.camelCase()}}: {{name.camelCase()}} ?? this.{{name.camelCase()}},
      {{name.camelCase()}}Failure: {{name.camelCase()}}Failure ?? this.{{name.camelCase()}}Failure,
    );
  }

  @override
  List<Object?> get props => [{{name.camelCase()}}Status, {{name.camelCase()}}, {{name.camelCase()}}Failure];{{/is_list}}
}
