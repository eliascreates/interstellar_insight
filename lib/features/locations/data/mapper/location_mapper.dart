import 'package:interstellar_insight/features/locations/data/models/location_model.dart';
import 'package:interstellar_insight/features/locations/domain/domain.dart';

Location toEntity(LocationModel model) {
  return Location(
    id: model.id,
    name: model.name,
    type: model.type,
    inhabitants: model.inhabitants,
    notableResidents: model.notableResidents,
    imageUrl: model.imageUrl,
  );
}

LocationModel fromEntity(Location entity) {
  return LocationModel(
    id: entity.id,
    name: entity.name,
    type: entity.type,
    inhabitants: entity.inhabitants,
    notableResidents: entity.notableResidents,
    imageUrl: entity.imageUrl,
  );
}
