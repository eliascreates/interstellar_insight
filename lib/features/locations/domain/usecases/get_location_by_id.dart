import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/locations/domain/repositories/location_repository.dart';

import '../entities/location.dart';

class GetLocationById extends UseCase<Location, LocationByIdParams> {
  final LocationRepository repository;

  const GetLocationById(this.repository);

  @override
  Future<Either<Failure, Location>> call(LocationByIdParams params) async {
    return await repository.getLocationById(params.id);
  }
}

class LocationByIdParams {
  final String id;

  const LocationByIdParams({required this.id});
}
