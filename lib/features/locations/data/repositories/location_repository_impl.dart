import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/features/locations/data/datasources/remote_location_datasource.dart';
import 'package:interstellar_insight/features/locations/domain/domain.dart';

import '../mapper/location_mapper.dart';

class LocationRepositoryImpl implements LocationRepository {
  final RemoteLocationDatasource remoteDatasource;

  const LocationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Location>>> getAllLocations() async {
    try {
      final locations = await remoteDatasource.getAllLocations();
      final locationsEntity =
          locations.map((location) => toEntity(location)).toList();

      return Right(locationsEntity);
    } catch (_) {
      return const Left(
        ServerFailure(
          message: 'unable to fetch locations. Try again layer',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Location>> getLocationById(String id) async {
    try {
      final location = await remoteDatasource.getLocationById(id);

      final locationEntity = toEntity(location);

      return Right(locationEntity);
    } catch (_) {
      return Left(
        ServerFailure(
          message: 'unable to get location with id $id. Try again layer',
        ),
      );
    }
  }
}
