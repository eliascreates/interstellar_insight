import '../../domain/domain.dart';
import '../models/character_model.dart';

Character toEntity(CharacterModel model) {
  return Character(
    id: model.id,
    name: model.name,
    status: model.status,
    species: model.species,
    gender: model.gender,
    hair: model.hair,
    alias: model.alias,
    origin: model.origin,
    abilities: model.abilities,
    imageUrl: model.imageUrl,
  );
}

CharacterModel fromEntity(Character entity) {
  return CharacterModel(
    id: entity.id,
    name: entity.name,
    status: entity.status,
    species: entity.species,
    gender: entity.gender,
    hair: entity.hair,
    alias: entity.alias,
    origin: entity.origin,
    abilities: entity.abilities,
    imageUrl: entity.imageUrl,
  );
}
