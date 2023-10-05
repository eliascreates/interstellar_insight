import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int id;
  final String name;
  final String type;
  final List<String> inhabitants;
  final List<String> notableResidents;
  final String imageUrl;

  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.inhabitants,
    required this.notableResidents,
    required this.imageUrl,
  });

  Location copyWith({
    int? id,
    String? name,
    String? type,
    List<String>? inhabitants,
    List<String>? notableResidents,
    String? imageUrl,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      inhabitants: inhabitants ?? this.inhabitants,
      notableResidents: notableResidents ?? this.notableResidents,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'inhabitants': inhabitants,
      'notable_residents': notableResidents,
      'img_url': imageUrl,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'].toInt() as int? ?? 0,
      name: map['name'] as String? ?? 'Unknown',
      type: map['type'] as String? ?? 'Unidentified',
      inhabitants: List<String>.from(
        (map['inhabitants'] as List<dynamic>? ?? []),
      ),
      notableResidents: List<String>.from(
        (map['notable_residents'] as List<dynamic>? ?? []),
      ),
      imageUrl: map['img_url'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'Location(id: $id, name: $name, type: $type, inhabitants: $inhabitants, notable_residents: $notableResidents, img_url: $imageUrl)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        inhabitants,
        notableResidents,
        imageUrl,
      ];
}
