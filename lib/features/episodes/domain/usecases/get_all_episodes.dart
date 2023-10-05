import 'package:dartz/dartz.dart';

import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';

import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

class GetAllEpisodes extends UseCase<List<Episode>, NoParams> {
  const GetAllEpisodes(this.repository);

  final EpisodeRepository repository;

  @override
  Future<Either<Failure, List<Episode>>> call(NoParams params) async {
    return await repository.getAllEpisodes();
  }
}
