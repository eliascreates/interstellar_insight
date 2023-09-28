import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String hair;
  final List<String> alias;
  final String origin;
  final List<String> abilities;
  final String imageUrl;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.hair,
    required List<String> alias,
    required this.origin,
    required this.abilities,
    required this.imageUrl,
  }) : alias = _formatAliasList(alias);

  String get firstName {
    final x = name.split(' ').first.trim();
    if (x.toLowerCase() == 'little' ||
        x.toLowerCase() == 'the' ||
        x.toLowerCase() == 'king' ||
        x.toLowerCase() == 'queen') {
      return name.trim();
    }
    return name.split(' ').first;
  }

  String get description {
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

  @override
  String toString() {
    return 'Character(id: $id, name: $name, status: $status, species: $species, gender: $gender, hair: $hair, alias: $alias, origin: $origin, abilities: $abilities, img_url: $imageUrl)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        gender,
        hair,
        alias,
        origin,
        abilities,
        imageUrl,
      ];
}

List<String> _formatAliasList(List<String> aliasList) {
  if (aliasList.isEmpty) return [];

  // Defines a regular expression pattern to match and remove content within parentheses.
  final RegExp parenthesesPattern = RegExp(r'\([^)]*\)');

  List<String> formattedAliases = [];

  for (String alias in aliasList) {
    // Remove content within parentheses.
    alias = alias.replaceAllMapped(parenthesesPattern, (match) => '');

    // Remove words followed by "by" (including "by").
    alias = alias.replaceAllMapped(RegExp(r'\s*by\s*\w+'), (match) => '');

    alias = alias.trim();

    formattedAliases.add(alias);
  }

  return formattedAliases;
}
