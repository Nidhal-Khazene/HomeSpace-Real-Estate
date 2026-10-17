import 'package:dartz/dartz.dart';
import 'package:home_space/core/errors/failures.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failures, T>> call([Param? param]);
}

class NoParam {}
