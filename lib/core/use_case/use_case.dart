import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCaseWithParam<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class UseCaseWith2Param<Type, Param, Param2> {
  Future<Either<Failure, Type>> call([Param param, Param2 param2]);
}
