import 'package:dartz/dartz.dart';

import 'package:interstellar_insight/core/errors/failure.dart';

import '../../domain/domain.dart';
import '../datasources/remote_character_datasource.dart';
import '../mapper/character_mapper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    try {
      final characters = await remoteDataSource.getAllCharacters();

      final charactersEntity =
          characters.map((character) => toEntity(character)).toList();

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
