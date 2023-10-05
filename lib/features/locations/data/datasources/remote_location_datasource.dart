import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:interstellar_insight/core/errors/exception.dart';
import 'package:interstellar_insight/core/network/endpoints.dart';
import 'package:interstellar_insight/features/locations/data/models/location_model.dart';

abstract class RemoteLocationDatasource {
  Future<List<LocationModel>> getAllLocations();
  Future<LocationModel> getLocationById(String id);
}

class RemoteLocationDatasourceImpl implements RemoteLocationDatasource {
  final http.Client client;

  const RemoteLocationDatasourceImpl({required this.client});

  @override
  Future<List<LocationModel>> getAllLocations() async {
    try {
      final response = await client.get(Uri.parse(Endpoints.locations));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        log('We got the locations data: $data');

        final locations = data.map((locationData) {
          return LocationModel.fromMap(locationData);
        }).toList();

        return locations;
      }

      throw ServerException(
        message:
            'Failed to load locations. Status code: ${response.statusCode}',
      );
    } catch (e) {
      throw ServerException(message: 'Failed to load locations. Error - $e');
    }
  }

  @override
  Future<LocationModel> getLocationById(String id) async {
    try {
      final response = await client.get(
        Uri.parse('${Endpoints.locations}/$id'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final location = LocationModel.fromMap(data);

        return location;
      } else {
        throw ServerException(
          message:
              'Failed to load location with id $id: status Code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw ServerException(message: 'Failed to load location. Error - $e');
    }
  }
}
