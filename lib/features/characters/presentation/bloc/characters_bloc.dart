import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/characters/characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

final characters = [
  Character(
    id: 1,
    name: "Gary Goodspeed",
    status: "Alive",
    species: "Human",
    gender: "Male",
    hair: "Blonde",
    alias: const [
      "The Gary (by Lord Commander and Invictus)",
      "Thunder Bandit(code name)",
      "Star Dragon(new code name)",
      "Primate(By Clarence)",
      "The Captain (self-proclaimed)",
      "Mommy (by the Dewinter children)",
      "Jerry by (Quinn)",
      "Gerald (by Quinn and the S.A.M.E.S)",
      "Humanoid trash (by Avocato)",
      "Generic Blonde Guy (by Ash)",
      "No-Good Thief (by Avocato/Invictus)",
      "Little Bastard (by Sheryl)",
      "Larry Tumbleweed (by Tribore)",
      "Harry Hoodseed (by Tribore)",
      "Leslie (by Tribore)",
      "Barry (by Tribore)",
      "The Fool Who Died A Thousand Deaths (by Invictus)"
    ],
    origin: "Earth",
    abilities: const [
      "Piloting",
      "Marksmanship",
      "Hand-to-hand combat",
      "Weapons: Blasters",
      "Weapons: Black hole gun (briefly)",
      "Weapons: Robot arm",
      "Weapons: Laser gun",
      "Weapons: Laser sword"
    ],
    imageUrl:
        "https://finalspaceapi.com/api/character/avatar/gary_goodspeed.png",
  ),
  Character(
      id: 2,
      name: "Mooncake",
      status: "Unknown",
      species: "Mooncake's Species",
      gender: "None (referred to as male)",
      hair: "None",
      alias: const [
        "Specimen E - 351",
        "Little Buddy",
        "Planet Destroyer",
        "Dude cake",
        "Little Guy",
        "The Key (by Lord Commander, Invictus, and Ash)",
        "The Missing Piece (by the Arachnitects)",
        "Homeslice (by Bolo)",
        "Booger Ball (by Kevin Van Newton)"
      ],
      origin: "Outer space",
      abilities: const [
        "Hovering",
        "Firing Laser Beams",
        "Planetary Destruction"
      ],
      imageUrl: "https://finalspaceapi.com/api/character/avatar/mooncake.jpg"),
  Character(
      id: 3,
      name: "Quinn Ergon",
      status: "Alive",
      species: "Human",
      gender: "Female",
      hair: "Dark Brown",
      alias: const [
        "Nightfall(codename)",
        "Muy Bueno Super Spicy Lady (by Gary)",
        "Magnificent Goddess (by Biskit)"
      ],
      origin: "Earth",
      abilities: const [
        "Astrophysicist",
        "Engineer",
        "Piloting",
        "Hand - to - hand Combat"
      ],
      imageUrl:
          "https://finalspaceapi.com/api/character/avatar/quinn_ergon.jpg"),
];

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
        print(characters);

        return state.copyWith(
          status: AppStatus.success,
          characters: characters,
          errorMessage: null,
        );
      }),
    );
    // emit(state.copyWith(
    //     characters: characters, status: AppStatus.success, errorMessage: null));
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
        print(character);
        return state.copyWith(
          status: AppStatus.success,
          characters: [character],
          errorMessage: null,
        );
      }),
    );
  }
}
