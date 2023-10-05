import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';

import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacterById extends UseCase<Character, CharacterByIdParams> {
  const GetCharacterById(this.repository);

  final CharacterRepository repository;

  @override
  Future<Either<Failure, Character>> call(CharacterByIdParams params) async {
    return await repository.getCharacterById(params.id);
  }
}

class CharacterByIdParams extends Equatable {
  final int id;

  const CharacterByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
