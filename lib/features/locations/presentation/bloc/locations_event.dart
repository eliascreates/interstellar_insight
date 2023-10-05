part of 'locations_bloc.dart';

sealed class LocationsEvent extends Equatable {
  const LocationsEvent();

  @override
  List<Object> get props => [];
}

class LocationsFetchedAll extends LocationsEvent {
  const LocationsFetchedAll();
}

class LocationsFetchedById extends LocationsEvent {
  final String id;

  const LocationsFetchedById({required this.id});

  @override
  List<Object> get props => [id];
}
