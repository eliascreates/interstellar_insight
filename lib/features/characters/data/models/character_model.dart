import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
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

  const CharacterModel({
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

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int? ?? 0,
      name: map['name'] as String? ?? 'Unknown',
      status: map['status'] as String? ?? 'Unknown',
      species: map['species'] as String? ?? 'Unknown',
      gender: map['gender'] as String? ?? 'Unknown',
      hair: map['hair'] as String? ?? 'Unknown',
      alias:
          (map['alias'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
              [],
      origin: map['origin'] as String? ?? 'Unknown',
      abilities: (map['abilities'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      imageUrl: map['img_url'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'hair': hair,
      'alias': alias,
      'origin': origin,
      'abilities': abilities,
      'img_url': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, gender: $gender, hair: $hair, alias: $alias, origin: $origin, abilities: $abilities, img_url: $imageUrl)';
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
