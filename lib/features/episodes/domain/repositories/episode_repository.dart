import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/features/episodes/domain/entities/episode.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<Episode>>> getAllEpisodes();
  Future<Either<Failure, Episode>> getEpisodeById(String id);
}
