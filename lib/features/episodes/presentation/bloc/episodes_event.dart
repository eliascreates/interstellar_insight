part of 'episodes_bloc.dart';

sealed class EpisodesEvent extends Equatable {
  const EpisodesEvent();

  @override
  List<Object> get props => [];
}

class EpisodesFetchedAll extends EpisodesEvent {
  const EpisodesFetchedAll();
}

class EpisodesFetchedById extends EpisodesEvent {
  final String id;

  const EpisodesFetchedById({required this.id});

  @override
  List<Object> get props => [id];
}
