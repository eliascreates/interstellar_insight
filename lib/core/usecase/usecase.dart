// lib/core/usecases/usecases.dart
import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
