import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/characters/characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetAllCharacters getAllCharacters;
  final GetCharacterById getCharacterById;

  CharactersBloc({
    required this.getAllCharacters,
    required this.getCharacterById,
  }) : super(const CharactersState()) {
    on<CharactersFetchedAll>(_onCharactersFetchedAll);
    on<CharactersFetchedById>(_onCharactersFetchedById);
  }

  Future<void> _onCharactersFetchedAll(
    CharactersFetchedAll event,
    Emitter<CharactersState> emit,
  ) async {
    // emit(state.copyWith(status: AppStatus.loading));

    final result = await getAllCharacters(const NoParams());

    emit(
      await result.fold((failure) async {
        return state.copyWith(
          status: AppStatus.failure,
          errorMessage: failure.message,
        );
      }, (characters) async {
        debugPrint('$characters');

        return state.copyWith(
          status: AppStatus.success,
          characters: characters,
          errorMessage: null,
        );
      }),
    );
  }

  Future<void> _onCharactersFetchedById(
    CharactersFetchedById event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.copyWith(status: AppStatus.loading));

    final result = await getCharacterById(CharacterByIdParams(id: event.id));

    emit(
      await result.fold((failure) async {
        return state.copyWith(
          status: AppStatus.failure,
          errorMessage: failure.message,
        );
      }, (character) async {
        debugPrint('$character');
        return state.copyWith(
          status: AppStatus.success,
          characters: [character],
          errorMessage: null,
        );
      }),
    );
  }
}
