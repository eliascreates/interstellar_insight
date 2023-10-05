part of 'characters_bloc.dart';

enum AppStatus { initial, loading, failure, success }

class CharactersState extends Equatable {
  const CharactersState({
    this.characters = const [],
    this.status = AppStatus.initial,
    this.errorMessage,
  });

  final List<Character> characters;
  final String? errorMessage;
  final AppStatus status;

  CharactersState copyWith({
    List<Character>? characters,
    String? errorMessage,
    AppStatus? status,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  String toString() =>
      'CharactersState(characters: ${characters.length}, status: $status, errorMessage: $errorMessage)';

  @override
  List<Object?> get props => [characters, status, errorMessage];
}
