import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/episodes/episodes.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final GetAllEpisodes getAllEpisodes;
  final GetEpisodeById getEpisodeById;

  EpisodesBloc({
    required this.getAllEpisodes,
    required this.getEpisodeById,
  }) : super(const EpisodesState()) {
    on<EpisodesFetchedAll>(_onEpisodesFetchedAll);
    on<EpisodesFetchedById>(_onEpisodesFetchedById);
  }

  Future<void> _onEpisodesFetchedAll(
      EpisodesFetchedAll event, Emitter<EpisodesState> emit) async {
    //TODO: write EpisodesFetchedAll implementation
    emit(state.copyWith(status: EpisodeStatus.loading));
    final result = await getAllEpisodes(const NoParams());

    emit(
      await result.fold(
        (failure) async => state.copyWith(
          status: EpisodeStatus.failure,
          errorMessage: failure.message,
        ),
        (episodes) async => state.copyWith(
          status: EpisodeStatus.success,
          episodes: episodes,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onEpisodesFetchedById(
      EpisodesFetchedById event, Emitter<EpisodesState> emit) async {
    //TODO: write EpisodesFetchedById implementation
    emit(state.copyWith(status: EpisodeStatus.loading));
    final result = await getEpisodeById(EpisodeByIdParams(id: event.id));

    emit(
      await result.fold(
        (failure) async => state.copyWith(
          status: EpisodeStatus.failure,
          errorMessage: failure.message,
        ),
        (episode) async => state.copyWith(
          status: EpisodeStatus.success,
          episodes: [episode],
          errorMessage: null,
        ),
      ),
    );
  }
}
