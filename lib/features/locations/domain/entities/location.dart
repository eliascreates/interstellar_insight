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
