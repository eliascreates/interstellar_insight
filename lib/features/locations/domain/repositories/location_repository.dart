import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';

import '../entities/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>> getAllLocations();
  Future<Either<Failure, Location>> getLocationById(String id);
}
