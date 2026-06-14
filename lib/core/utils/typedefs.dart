import 'package:dartz/dartz.dart';
import 'package:ecom/core/errors/failure.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<Failure, T>>;
