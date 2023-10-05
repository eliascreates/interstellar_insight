part of 'locations_bloc.dart';

enum LocationStatus { initial, loading, success, failure }

class LocationsState extends Equatable {
  const LocationsState({
    this.locations = const [],
    this.status = LocationStatus.initial,
    this.errorMessage,
  });

  final List<Location> locations;
  final LocationStatus status;
  final String? errorMessage;

  LocationsState copyWith({
    List<Location>? locations,
    LocationStatus? status,
    String? errorMessage,
  }) {
    return LocationsState(
      locations: locations ?? this.locations,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'LocationState(locations: ${locations.length}, status: $status, errorMessage: $errorMessage)';

  @override
  List<Object?> get props => [locations, status, errorMessage];
}
