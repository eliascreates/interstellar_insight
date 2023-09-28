import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:interstellar_insight/core/network/endpoints.dart';
import 'package:interstellar_insight/features/characters/characters.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'remote_character_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late CharacterRemoteDataSource dataSource;

  late http.Client mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = CharacterRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllCharacters', () {
    test('should return a list of [CharacterModel]', () async {
      //Arrange
      when(mockHttpClient.get(Uri.parse(Endpoints.characters),
              headers: {'Content-Type': 'application/json; charset=utf-8'}))
          .thenAnswer(
        (_) async =>
            http.Response(fixture('finalspace_all_characters.json'), 200),
      );

      const characters = [
        CharacterModel(
            id: 1,
            name: "Gary Goodspeed",
            status: "Alive",
            species: "Human",
            gender: "Male",
            hair: "Blonde",
            alias: [
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
            abilities: [
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
                "https://finalspaceapi.com/api/character/avatar/gary_goodspeed.png"),
        CharacterModel(
            id: 2,
            name: "Mooncake",
            status: "Unknown",
            species: "Mooncake's Species",
            gender: "None (referred to as male)",
            hair: "None",
            alias: [
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
            abilities: [
              "Hovering",
              "Firing Laser Beams",
              "Planetary Destruction"
            ],
            imageUrl:
                "https://finalspaceapi.com/api/character/avatar/mooncake.jpg"),
        CharacterModel(
            id: 3,
            name: "Quinn Ergon",
            status: "Alive",
            species: "Human",
            gender: "Female",
            hair: "Dark Brown",
            alias: [
              "Nightfall(codename)",
              "Muy Bueno Super Spicy Lady (by Gary)",
              "Magnificent Goddess (by Biskit)"
            ],
            origin: "Earth",
            abilities: [
              "Astrophysicist",
              "Engineer",
              "Piloting",
              "Hand - to - hand Combat"
            ],
            imageUrl:
                "https://finalspaceapi.com/api/character/avatar/quinn_ergon.jpg"),
      ];

      //Act

      final result = await dataSource.getAllCharacters();

      //Assert
      expect(result, characters);
    });
  });

  group('getCharacterById', () {
    const int testId = 1;

    const CharacterModel character = CharacterModel(
      id: 1,
      name: "Gary Goodspeed",
      status: "Alive",
      species: "Human",
      gender: "Male",
      hair: "Blonde",
      alias: [
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
      abilities: [
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

    test('should return a [CharacterModel]', () async {
      //Arrange
      when(mockHttpClient.get(Uri.parse("${Endpoints.characters}/$testId"),
              headers: {'Content-Type': 'application/json; charset=utf-8'}))
          .thenAnswer(
        (_) async =>
            http.Response(fixture('finalspace_character_by_id.json'), 200),
      );

      //Act
      final result = await dataSource.getCharacterById(testId);

      //Assert
      expect(result, character);
    });
  });
}
