import 'package:dartz/dartz.dart';
import 'package:interstellar_insight/core/errors/failure.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/locations/domain/repositories/location_repository.dart';

import '../entities/location.dart';

class GetAllLocations extends UseCase<List<Location>, NoParams> {
  final LocationRepository repository;

  const GetAllLocations(this.repository);

  @override
  Future<Either<Failure, List<Location>>> call(NoParams params) async {
    return await repository.getAllLocations();
  }
}
