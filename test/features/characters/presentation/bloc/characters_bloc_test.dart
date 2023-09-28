import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'characters_bloc_test.mocks.dart';

@GenerateMocks([GetAllCharacters, GetCharacterById])
void main() {
  late MockGetAllCharacters mockGetAllCharacters;
  late MockGetCharacterById mockGetCharacterById;
  late CharactersBloc bloc;

  setUp(() {
    mockGetAllCharacters = MockGetAllCharacters();
    mockGetCharacterById = MockGetCharacterById();
    bloc = CharactersBloc(
      getAllCharacters: mockGetAllCharacters,
      getCharacterById: mockGetCharacterById,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is AppStatus.initial when the bloc is instantiated', () {
    expect(bloc.state.status, equals(AppStatus.initial));
  });

  group('CharactersFetchedAll', () {
    final characterEntities = [
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
          imageUrl:
              "https://finalspaceapi.com/api/character/avatar/mooncake.jpg"),
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

    blocTest(
      'Should get data from the getAllCharacters usecase ',
      build: () {
        when(mockGetAllCharacters(const NoParams())).thenAnswer(
          (_) async => Right(characterEntities),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const CharactersFetchedAll()),
      verify: (bloc) => verify(mockGetAllCharacters(const NoParams())),
    );
    blocTest(
      'Should emit state status AppStatus.[loading, success] when all characters are fetched',
      build: () {
        when(mockGetAllCharacters(const NoParams()))
            .thenAnswer((_) async => Right(characterEntities));
        return bloc;
      },
      act: (bloc) => bloc.add(const CharactersFetchedAll()),
      expect: () => [
        const CharactersState(characters: [], status: AppStatus.loading),
        CharactersState(
            characters: characterEntities, status: AppStatus.success),
      ],
      verify: (bloc) => verify(mockGetAllCharacters(const NoParams())),
    );
  });

  group('CharactersFetchedById', () {
    const testId = 1;
    final character = Character(
      id: testId,
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
    );

    blocTest(
      'should get data from the getCharacterById usecase',
      build: () {
        when(mockGetCharacterById(const CharacterByIdParams(id: testId)))
            .thenAnswer((_) async => Right(character));
        return bloc;
      },
      act: (bloc) => bloc.add(const CharactersFetchedById(id: testId)),
      verify: (bloc) =>
          mockGetCharacterById(const CharacterByIdParams(id: testId)),
    );

    blocTest(
      'should emit [AppStatus.loading, AppStatus.success] when getCharacterById usecase is successful',
      build: () {
        when(mockGetCharacterById(const CharacterByIdParams(id: testId)))
            .thenAnswer((_) async => Right(character));
        return bloc;
      },
      act: (bloc) => bloc.add(const CharactersFetchedById(id: testId)),
      expect: () => [
        expect(bloc.state.status, AppStatus.loading),
        expect(bloc.state.status, AppStatus.success),
      ],
    );
  });
}
