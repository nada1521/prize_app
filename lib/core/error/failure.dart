// ignore_for_file: unintended_html_in_doc_comment

import 'package:prize/core/error/exceptions/server_exception.dart';
import 'package:prize/core/network/error_handling/api_error_handler.dart';
import 'package:equatable/equatable.dart';
import 'package:prize/core/network/error_handling/api_error_model.dart';

import 'exceptions/local_exception.dart';

/// [Failure] is using as a return type in the Repository, like:
/// Either<Failure, ..>.
class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  /// Use this named constructor when get [Failure] from [ServerException]
  factory Failure.fromServer(ServerException e) {
    return Failure(e.error.message);
  }

  /// Use this named constructor when get [Failure] from an [Exception]
  factory Failure.fromException(Object e) {
    if (e is ServerException) {
      return Failure(e.error.message);
    } else if (e is LocalException) {
      return Failure(e.message);
    } else if (e is ApiErrorModel) {
      return Failure(e.message);
    }

    final error = ApiErrorHandler.handle(e);
    return Failure(error.message);
  }

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
}
