part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class CharactersFetchedAll extends CharactersEvent {
  const CharactersFetchedAll();
}

class CharactersFetchedById extends CharactersEvent {
  const CharactersFetchedById({required this.id});

  final int id;

  @override
  List<Object> get props => [id];
}
