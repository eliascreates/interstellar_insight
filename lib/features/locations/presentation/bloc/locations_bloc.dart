import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:interstellar_insight/core/usecase/usecase.dart';

import '../../domain/domain.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final GetAllLocations getAllLocations;
  final GetLocationById getLocationById;

  LocationsBloc({
    required this.getAllLocations,
    required this.getLocationById,
  }) : super(const LocationsState()) {
    on<LocationsFetchedAll>(_onLocationsFetchedAll);
    on<LocationsFetchedById>(_onLocationsFetchedById);
  }

  Future<void> _onLocationsFetchedAll(
    LocationsFetchedAll event,
    Emitter<LocationsState> emit,
  ) async {
    emit(state.copyWith(status: LocationStatus.loading));

    final result = await getAllLocations(const NoParams());

    emit(
      await result.fold(
        (failure) async => state.copyWith(
          status: LocationStatus.failure,
          errorMessage: failure.message,
        ),
        (locations) async => state.copyWith(
          status: LocationStatus.success,
          locations: locations,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onLocationsFetchedById(
    LocationsFetchedById event,
    Emitter<LocationsState> emit,
  ) async {
    final result = await getLocationById(LocationByIdParams(id: event.id));

    emit(
      await result.fold(
        (failure) async => state.copyWith(
          status: LocationStatus.failure,
          errorMessage: failure.message,
        ),
        (location) async => state.copyWith(
          status: LocationStatus.success,
          locations: [location],
          errorMessage: null,
        ),
      ),
    );
  }
}
