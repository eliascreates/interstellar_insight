import 'package:dartz/dartz.dart';

import 'package:interstellar_insight/core/errors/failure.dart';

import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();

  Future<Either<Failure, Character>> getCharacterById(String id);
}
