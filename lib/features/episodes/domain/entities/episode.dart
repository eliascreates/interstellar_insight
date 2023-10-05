import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String name;
  final String releaseDate;
  final String director;
  final String writer;
  final List<String> characters;
  final String imageUrl;

  const Episode({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.director,
    required this.writer,
    required this.characters,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Episode(id: $id, name: $name, air_date: $releaseDate, director: $director, writer: $writer, characters: $characters, img_url: $imageUrl)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        releaseDate,
        director,
        writer,
        characters,
        imageUrl,
      ];
}
