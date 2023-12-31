import 'package:dartz/dartz.dart';

import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';

import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetAllCharacters implements UseCase<List<Character>, NoParams> {
  const GetAllCharacters(this.repository);

  final CharacterRepository repository;

  @override
  Future<Either<Failure, List<Character>>> call(NoParams params) async {
    return await repository.getAllCharacters();
  }
}
