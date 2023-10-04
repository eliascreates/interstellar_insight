// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  EpisodesState copyWith({
    List<Episode>? episodes,
    EpisodeStatus? status,
    String? errorMessage,
  }) {
    return EpisodesState(
      episodes: episodes ?? this.episodes,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        episodes,
        status,
        errorMessage,
      ];
}
