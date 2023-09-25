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

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.hair,
    required this.alias,
    required this.origin,
    required this.abilities,
    required this.imageUrl,
  });

  String get firstName {
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
