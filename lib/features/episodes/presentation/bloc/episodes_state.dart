part of 'episodes_bloc.dart';

enum EpisodeStatus { initial, loading, success, failure }

class EpisodesState extends Equatable {
  const EpisodesState({
    this.episodes = const [],
    this.status = EpisodeStatus.initial,
    this.errorMessage,
  });
  final List<Episode> episodes;
  final EpisodeStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [];
}
