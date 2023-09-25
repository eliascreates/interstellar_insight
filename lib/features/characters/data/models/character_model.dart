import 'dart:convert';

class CharacterModel {
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
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      hair: map['hair'] as String,
      alias: List<String>.from((map['alias'] as List<String>)),
      origin: map['origin'] as String,
      abilities: List<String>.from((map['abilities'] as List<String>)),
      imageUrl: map['img_rl'] as String,
    );
  }

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
      
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
      'imageUrl': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, gender: $gender, hair: $hair, alias: $alias, origin: $origin, abilities: $abilities, img_url: $imageUrl)';
  }
}