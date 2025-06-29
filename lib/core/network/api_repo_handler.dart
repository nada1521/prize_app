import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:prize/core/dummy/dummy_delay.dart';
import 'package:prize/core/dummy/is_dummy.dart';
import 'package:prize/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ApiRepoHandler {
  static FutureOr<Either<Failure, T>> execute<T>(
    FutureOr<T> Function() callback, {
    FutureOr<T> Function()? dummy,
    void Function()? onError,
  }) async {
    if (isDummy && dummy != null) {
      return _executeDemo(dummy);
    }
    try {
      return right(await callback());
    } catch (error) {
      // if (kDebugMode) rethrow;
      onError?.call();
      return left(Failure.fromException(error));
    }
  }

  static FutureOr<Either<Failure, T>> _executeDemo<T>(FutureOr<T> Function() callback) async {
    try {
      await dummyDelay();
      return right(await callback());
    } catch (error) {
      if (kDebugMode) rethrow;
      return left(Failure.fromException(error));
    }
  }
}
