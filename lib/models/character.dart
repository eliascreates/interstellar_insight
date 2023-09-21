class Character {
  final String id;
  final String name;
  final String image;
  final String status;
  final List<String> abilities;
  final String species;
  final String origin;

  const Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    this.abilities = const [
      "Piloting",
      "Marksmanship",
      "Hand-to-hand combat",
      "Weapons: Blasters",
      "Weapons: Black hole gun (briefly)",
      "Weapons: Robot arm",
      "Weapons: Laser gun",
      "Weapons: Laser sword"
    ],
    required this.species,
    required this.origin,
  });

  String get description {
    final firstName = name.split(' ').first;
    final visibleAbilities = abilities.take(3);
    if (visibleAbilities.isEmpty) {
      return "$firstName does not have any abilities";
    }

    final stringAbilities = visibleAbilities.take(3).join(', ');
    final remainingAbilities = visibleAbilities.length > 3 ? ', and more' : '';

    if (visibleAbilities.length == 2 || visibleAbilities.length == 3) {
      final lastCommaIndex = stringAbilities.lastIndexOf(',');
      final modifiedVisibleAbilities = stringAbilities.replaceRange(
          lastCommaIndex, lastCommaIndex + 1, ', and');

      return "$firstName's abilities include $modifiedVisibleAbilities$remainingAbilities";
    }

    return "$firstName's abilities include $stringAbilities$remainingAbilities";
  }
}

List<Character> characters = [
  const Character(
    id: '1',
    name: 'Quinn Ergon',
    image: 'assets/images/quinn_ergon.jpg',
    status: 'Alive',
    species: 'Human',
    origin: 'Earth',
  ),
  const Character(
    id: '2',
    name: 'Gary Goodspeed',
    image: 'assets/images/gary_goodspeed.png',
    status: 'Alive',
    species: 'Human',
    origin: 'Earth',
  ),
  const Character(
    id: '3',
    name: 'Avocato',
    image: 'assets/images/avocato.jpg',
    status: 'Dead',
    species: 'Ventrexian',
    origin: 'Ventrexia',
  ),
  const Character(
    id: '4',
    name: 'Ash Graven',
    image: 'assets/images/ash_graven.png',
    status: 'Unknown',
    species: 'Serepentian',
    origin: 'Serepentis',
  ),
  const Character(
    id: '1',
    name: 'Quinn Ergon',
    image: 'assets/images/quinn_ergon.jpg',
    status: 'Alive',
    species: 'Human',
    origin: 'Earth',
  ),
  const Character(
    id: '2',
    name: 'Gary Goodspeed',
    image: 'assets/images/gary_goodspeed.png',
    status: 'Alive',
    species: 'Human',
    origin: 'Earth',
  ),
  const Character(
    id: '3',
    name: 'Avocato',
    image: 'assets/images/avocato.jpg',
    status: 'Dead',
    species: 'Ventrexian',
    origin: 'Ventrexia',
  ),
  const Character(
    id: '4',
    name: 'Ash Graven',
    image: 'assets/images/ash_graven.png',
    status: 'Unknown',
    species: 'Serepentian',
    origin: 'Serepentis',
  ),
  const Character(
    id: '4',
    name: 'Ash Graven',
    image: 'assets/images/ash_graven.png',
    status: 'Unknown',
    species: 'Serepentian',
    origin: 'Serepentis',
  ),
];
