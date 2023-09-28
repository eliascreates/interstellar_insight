import 'package:dartz/dartz.dart';

import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/features/characters/domain/domain.dart';

import '../datasources/remote_character_datasource.dart';
import '../mapper/character_mapper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    // TODO: implement getAllCharacters
    try {
      print('sucesss sof far');
      final characters = await remoteDataSource.getAllCharacters();
      print(characters);

      final charactersEntity =
          characters.map((character) => toEntity(character)).toList();

      print(charactersEntity);
      return Right(charactersEntity);
    } catch (_) {
      return const Left(
        ServerFailure(
            message: 'Failed to fetch characters. Please try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, Character>> getCharacterById(int id) async {
    // TODO: implement getCharacterById
    try {
      final character = await remoteDataSource.getCharacterById(id);
      final characterEntity = toEntity(character);
      return Right(characterEntity);
    } catch (_) {
      return const Left(
        ServerFailure(
            message: 'Failed to fetch character. Please try again later.'),
      );
    }
  }
}
