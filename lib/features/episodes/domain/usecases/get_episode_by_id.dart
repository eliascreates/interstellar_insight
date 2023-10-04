import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/episodes/domain/entities/episode.dart';
import 'package:interstellar_insight/features/episodes/domain/repositories/episode_repository.dart';

class GetEpisodeById extends UseCase<Episode, EpisodeByIdParams> {
  final EpisodeRepository repository;

  GetEpisodeById(this.repository);

  @override
  Future<Either<Failure, Episode>> call(EpisodeByIdParams params) async {
    return await repository.getEpisodeById(params.id);
  }
}

class EpisodeByIdParams {
  final String id;

  const EpisodeByIdParams({required this.id});
}
