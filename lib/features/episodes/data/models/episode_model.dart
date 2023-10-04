import 'package:equatable/equatable.dart';

class EpisodeModel extends Equatable {
  final int id;
  final String name;
  final String releaseDate;
  final String director;
  final String writer;
  final List<String> characters;
  final String imageUrl;

  const EpisodeModel({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.director,
    required this.writer,
    required this.characters,
    required this.imageUrl,
  });

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map['id'] as int? ?? 0,
      name: map['name'] as String? ?? 'Unknown',
      releaseDate: map['air_date'] as String? ?? '',
      director: map['director'] as String? ?? 'Unknown',
      writer: map['writer'] as String? ?? 'Unknown',
      characters: List<String>.from(
        (map['characters'] as List<String>?) ?? [],
      ),
      imageUrl: map['img_url'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'EpisodeModel(id: $id, name: $name, air_date: $releaseDate, director: $director, writer: $writer, characters: $characters, img_url: $imageUrl)';
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
