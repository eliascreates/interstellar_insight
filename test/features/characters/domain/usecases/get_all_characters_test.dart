import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interstellar_insight/core/usecase/usecase.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_all_characters_test.mocks.dart';

@GenerateMocks([CharacterRepository])
void main() {
  group('Get All Characters', () {
    late MockCharacterRepository mockCharacterRepository;
    late GetAllCharacters usecase;

    setUp(() {
      mockCharacterRepository = MockCharacterRepository();
      usecase = GetAllCharacters(mockCharacterRepository);
    });

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

    test('should get a list of characters', () async {
      //Arrange
      when(mockCharacterRepository.getAllCharacters()).thenAnswer((_) async {
        return Right(characterEntities);
      });

      //Act
      final result = await usecase(const NoParams());

      //Assert
      expect(result, Right(characterEntities));
      verify(mockCharacterRepository.getAllCharacters());
      verifyNoMoreInteractions(mockCharacterRepository);
    });
  });
}
