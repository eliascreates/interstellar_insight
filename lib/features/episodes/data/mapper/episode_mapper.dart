import '../models/episode_model.dart';
import '../../domain/domain.dart';

Episode toEntity(EpisodeModel model) {
  return Episode(
    id: model.id,
    name: model.name,
    releaseDate: model.releaseDate,
    director: model.director,
    writer: model.writer,
    characters: model.characters,
    imageUrl: model.imageUrl,
  );
}

EpisodeModel fromEntity(Episode entity) {
  return EpisodeModel(
    id: entity.id,
    name: entity.name,
    releaseDate: entity.releaseDate,
    director: entity.director,
    writer: entity.writer,
    characters: entity.characters,
    imageUrl: entity.imageUrl,
  );
}
