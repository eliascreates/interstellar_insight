import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/characters/domain/repositories/character_repository.dart';

import '../entities/character.dart';

class GetCharacterById extends UseCase<Character, CharacterByIdParams> {
  final CharacterRepository repository;

  GetCharacterById(this.repository);

  @override
  Future<Either<Failure, Character>> call(CharacterByIdParams params) async {
    return await repository.getCharacterById(params.id);
  }
}

class CharacterByIdParams {
  final String id;

  const CharacterByIdParams({required this.id});
}
