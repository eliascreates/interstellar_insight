class Character {
  final String id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String hair;
  List<String> alias = [];
  final String origin;
  final List<String> abilities;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.hair,
    required List<String> alias,
    required this.image,
    required this.abilities,
    required this.species,
    required this.origin,
  }) {
    this.alias = cleanAliasList(alias);
  }

  String get firstName {
    return name.split(' ').first;
  }

  String get description {
    // final firstName = name.split(' ').first;
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

  static List<String> cleanAliasList(List<String> aliasList) {
    if (aliasList.isEmpty) return [];

    // Define a regular expression pattern to match and remove content within parentheses.
    final RegExp parenthesesPattern = RegExp(r'\([^)]*\)');

    // Define a list to store the cleaned aliases.
    List<String> cleanedAliases = [];

    for (String alias in aliasList) {
      // Remove content within parentheses.
      alias = alias.replaceAllMapped(parenthesesPattern, (match) => '');

      // Remove words followed by "by" (including "by").
      alias = alias.replaceAllMapped(RegExp(r'\s*by\s*\w+'), (match) => '');

      // Trim any extra spaces.
      alias = alias.trim();

      // Add the cleaned alias to the list.
      cleanedAliases.add(alias);
    }

    return cleanedAliases;
  }
}

List<Character> characters = [
  Character(
    id: '3',
    name: 'Quinn Ergon',
    gender: 'Female',
    hair: 'Dark Brown',
    alias: [
      "Nightfall(codename)",
      "Muy Bueno Super Spicy Lady (by Gary)",
      "Magnificent Goddess (by Biskit)"
    ],
    abilities: [
      "Astrophysicist",
      "Engineer",
      "Piloting",
      "Hand - to - hand Combat"
    ],
    image: 'assets/images/quinn_ergon.jpg',
    status: 'Alive',
    species: 'Human',
    origin: 'Earth',
  ),
  Character(
    id: '2',
    name: 'Gary Goodspeed',
    gender: 'Male',
    hair: 'Blonde',
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
    image: 'assets/images/gary_goodspeed.png',
    status: 'Alive',
    species: 'Human',
    origin: 'Earth',
  ),
  Character(
    id: '3',
    name: 'Avocato',
    gender: 'Male',
    hair: "Dark Teal / White ",
    alias: [
      "General Avocato",
      "Mr. Whiskers (by Gary)",
      "Cat Guy (by Gary)",
      "Dad (by Little Cato)",
      "My Boyfriend (by Gary)",
      "Furry Fantasy Dad Guy (by Biskit)",
      "Daddy-O (by Little Cato)",
      "Pops (by Little Cato)",
      "Ventrexian Filth (by Ash)"
    ],
    abilities: ["Marksmanship", "Surgery", "Combat prowess"],
    image: 'assets/images/avocato.jpg',
    status: 'Dead',
    species: 'Ventrexian',
    origin: 'Ventrexia',
  ),
  Character(
    id: '7',
    name: 'Ash Graven',
    gender: 'Female',
    hair: 'Pink',
    alias: [
      "Ashy",
      "Ms. Graven",
      "Ma'am",
      "Self-Doubting Adolescent Demon (by Gary)",
      "Child of Werthrent",
      "Baby Sis (by Fox)",
      "Daughter (by Clarence)",
      "Child (by Invictus)"
    ],
    abilities: [
      "Dark Energy Manipulation",
      "Telekinesis",
      "Flight",
      "Pyrokinesis"
    ],
    image: 'assets/images/ash_graven.png',
    status: 'Unknown',
    species: 'Serepentian',
    origin: 'Serepentis',
  ),
  Character(
      id: '6',
      name: "KVN",
      status: "Operational",
      species: "Robot",
      gender: "None(referred to as Male)",
      hair: "None",
      alias: [
        "Decaying Pile of Fecal Matter (by Gary)",
        "Waste of Life (by H.U.E.)",
        "Beelzebub (by Gary)"
      ],
      origin: "Some Factory",
      abilities: [
        "Hovering ",
        "Marksmanship",
        "Solving riddles",
        "Nigh-Invulnerability"
      ],
      image: "assets/images/kvn.jpg"),
];
