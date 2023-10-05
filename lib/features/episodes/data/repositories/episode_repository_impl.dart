import 'package:dartz/dartz.dart';

import 'package:interstellar_insight/core/errors/failure.dart';

import '../../domain/domain.dart';
import '../datasources/remote_episode_datasource.dart';
import '../mapper/episode_mapper.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final RemoteEpisodeDataSource remoteDataSource;

  EpisodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Episode>>> getAllEpisodes() async {
    try {
      final episodes = await remoteDataSource.getAllEpisodes();

      final episodesEntity = episodes.map((character) {
        return toEntity(character);
      }).toList();

      return Right(episodesEntity);
    } catch (e) {
      return const Left(
        ServerFailure(
          message: 'Failed to fetch all Episodes, please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Episode>> getEpisodeById(String id) async {
    try {
      final episode = await remoteDataSource.getEpisodeById(id);
      final episodeEntity = toEntity(episode);

      return Right(episodeEntity);
    } catch (e) {
      return Left(
        ServerFailure(
          message:
              'Failed to fetch an episode with an id: $id - please try again later',
        ),
      );
    }
  }
}
