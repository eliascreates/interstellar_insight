import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/features/locations/data/datasources/remote_location_datasource.dart';
import 'package:interstellar_insight/features/locations/domain/domain.dart';

class LocationRepositoryImpl implements LocationRepository {
  final RemoteLocationDatasource remoteDatasource;

  const LocationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Location>>> getAllLocations() async {
    // TODO: implement getAllLocations
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Location>> getLocationById(String id) {
    // TODO: implement getLocationById
    throw UnimplementedError();
  }
}
