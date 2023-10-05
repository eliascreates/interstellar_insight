import 'package:interstellar_insight/features/locations/data/models/location_model.dart';

abstract class RemoteLocationDatasource {
  Future<List<LocationModel>> getAllLocations();
  Future<LocationModel> getLocationById();
}
