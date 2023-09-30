import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_character_by_id_test.mocks.dart';

@GenerateMocks([CharacterRepository])
void main() {
  group('Get Character By Id', () {
    late MockCharacterRepository mockCharacterRepository;
    late GetCharacterById usecase;

    setUp(() {
      mockCharacterRepository = MockCharacterRepository();
      usecase = GetCharacterById(mockCharacterRepository);
    });
    const testId = 1;
    const character = Character(
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

    test('should return a single [Character]', () async {
      //Arrange
      when(mockCharacterRepository.getCharacterById(testId))
          .thenAnswer((_) async => const Right(character));

      //Act
      final result = await usecase(const CharacterByIdParams(id: testId));

      //Assert
      expect(result, const Right(character));
      verify(mockCharacterRepository.getCharacterById(testId));
      verifyNoMoreInteractions(mockCharacterRepository);
    });
  });
}
