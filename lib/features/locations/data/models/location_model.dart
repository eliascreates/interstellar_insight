import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final int id;
  final String name;
  final String type;
  final List<String> inhabitants;
  final List<String> notableResidents;
  final String imageUrl;

  const LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.inhabitants,
    required this.notableResidents,
    required this.imageUrl,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
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
    return 'LocationModel(id: $id, name: $name, type: $type, inhabitants: $inhabitants, notable_residents: $notableResidents, img_url: $imageUrl)';
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
