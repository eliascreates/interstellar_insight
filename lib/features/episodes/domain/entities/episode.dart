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

// const List<Episode> episodes = [
//   Episode(
//       id: 1,
//       name: "Chapter 1",
//       releaseDate: "02/15/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/2",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/5",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11"
//       ],
//       imageUrl: "assets/images/chapter1.jpg"),
//   Episode(
//       id: 2,
//       name: "Chapter 2",
//       releaseDate: "02/15/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/2",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/5",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/10",
//         "https://finalspaceapi.com/api/v0/character/12",
//         "https://finalspaceapi.com/api/v0/character/14"
//       ],
//       imageUrl: "assets/images/chapter2.jpg"),
//   Episode(
//       id: 3,
//       name: "Chapter 3",
//       releaseDate: "02/26/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/5",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11",
//         "https://finalspaceapi.com/api/v0/character/14"
//       ],
//       imageUrl: "assets/images/chapter3.jpg"),
//   Episode(
//       id: 4,
//       name: "Chapter 4",
//       releaseDate: "03/19/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/5",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/15",
//         "https://finalspaceapi.com/api/v0/character/11"
//       ],
//       imageUrl: "assets/images/chapter4.jpg"),
//   Episode(
//       id: 5,
//       name: "Chapter 5",
//       releaseDate: "03/19/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/5",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11",
//         "https://finalspaceapi.com/api/v0/character/14"
//       ],
//       imageUrl: "assets/images/chapter5.jpg"),
//   Episode(
//       id: 6,
//       name: "Chapter 6",
//       releaseDate: "03/26/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/5",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11"
//       ],
//       imageUrl: "assets/images/chapter6.jpg"),
//   Episode(
//       id: 7,
//       name: "Chapter 7",
//       releaseDate: "04/09/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/12"
//       ],
//       imageUrl: "assets/images/chapter7.jpg"),
//   Episode(
//       id: 8,
//       name: "Chapter 8",
//       releaseDate: "04/16/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11",
//         "https://finalspaceapi.com/api/v0/character/12",
//         "https://finalspaceapi.com/api/v0/character/15",
//         "https://finalspaceapi.com/api/v0/character/18"
//       ],
//       imageUrl: "assets/images/chapter8.jpg"),
//   Episode(
//       id: 9,
//       name: "Chapter 9",
//       releaseDate: "04/23/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11",
//         "https://finalspaceapi.com/api/v0/character/14",
//         "https://finalspaceapi.com/api/v0/character/22"
//       ],
//       imageUrl: "assets/images/chapter9.jpg"),
//   Episode(
//       id: 10,
//       name: "Chapter 10",
//       releaseDate: "04/30/2018",
//       director: "Mike Roberts",
//       writer: "Olan Rogers",
//       characters: [
//         "https://finalspaceapi.com/api/v0/character/1",
//         "https://finalspaceapi.com/api/v0/character/3",
//         "https://finalspaceapi.com/api/v0/character/4",
//         "https://finalspaceapi.com/api/v0/character/6",
//         "https://finalspaceapi.com/api/v0/character/9",
//         "https://finalspaceapi.com/api/v0/character/11",
//         "https://finalspaceapi.com/api/v0/character/14",
//         "https://finalspaceapi.com/api/v0/character/15",
//         "https://finalspaceapi.com/api/v0/character/22"
//       ],
//       imageUrl: "assets/images/chapter10.jpg"),
// ];
