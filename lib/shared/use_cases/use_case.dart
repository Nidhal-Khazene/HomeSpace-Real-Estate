import 'package:dartz/dartz.dart';
import 'package:home_space/core/errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call([Param? param, dynamic secondParam]);
}

class NoParam {}
