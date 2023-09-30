import 'package:equatable/equatable.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';
import 'package:interstellar_insight/core/functions/format_alias_list.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String hair;
  final List<String> _alias;
  final String origin;
  final List<String> abilities;
  final String imageUrl;

  const Character({
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
  }) : _alias = alias;

  String get firstName {
    final wordsToCheck = {'little', 'the', 'general', 'king', 'queen'};
    final nameParts = name.trim().split(' ');
    final hasWord = wordsToCheck.contains(nameParts.first.toLowerCase());
    if (nameParts.isNotEmpty && hasWord) {
      return name.trim();
    }
    return nameParts.first;
  }

  List<String> get alias => formatAliasList(_alias);

  String get singleAlias {
    if (_alias.isEmpty) return "No known alias";

    return "Code name: ${alias.first}";
  }

  String get description {
    if (abilities.isEmpty) {
      return "$firstName does not have any abilities";
    }

    final visibleAbilities = abilities.take(3).toList();
    final remainingAbilitiesCount = abilities.length - visibleAbilities.length;

    String abilitiesDescription = visibleAbilities.join(', ');

    if (visibleAbilities.length == 2 || visibleAbilities.length == 3) {
      final lastCommaIndex = abilitiesDescription.lastIndexOf(',');
      abilitiesDescription = abilitiesDescription.replaceRange(
          lastCommaIndex, lastCommaIndex + 1, ', and');
    } else if (remainingAbilitiesCount > 0) {
      abilitiesDescription += ', and $remainingAbilitiesCount more';
    }

    return "$firstName's abilities include $abilitiesDescription";
  }

  CharacterStatus get cleanStatus => CharacterStatusX.fromString(status);

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
