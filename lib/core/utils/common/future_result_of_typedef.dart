import 'package:dartz/dartz.dart';
import 'package:prize/core/error/failure.dart';

/// This is just alias to [Future<Either<Failure, T>>]
typedef FutureResultOf<T> = Future<Either<Failure, T>>;
