import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interstellar_insight/features/episodes/domain/entities/episode.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(const EpisodesState()) {
    on<EpisodesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
