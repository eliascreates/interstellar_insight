import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'features/home/home.dart';
import 'service_locator.dart' as di;
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

Future<void> main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersBloc(
            getAllCharacters: di.sl<GetAllCharacters>(),
            getCharacterById: di.sl<GetCharacterById>(),
          )..add(const CharactersFetchedAll()),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interstellar Insight App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.deepPurple,
      )),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  // late Future<CharacterModel> futureCharacter;
  late Future<CharacterModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    // futureCharacter = CharacterRemoteDataSourceImpl(client: http.Client())
    //     .getCharacterById(1);
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<CharacterModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );

    // return FutureBuilder<CharacterModel>(
    //   future: futureCharacter,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return Text(snapshot.data!.name);
    //     } else if (snapshot.hasError) {
    //       return Text('${snapshot.error}');
    //     }

    //     // By default, show a loading spinner.
    //     return const CircularProgressIndicator();
    //   },
    // );
  }
}

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
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      hair: map['hair'] as String,
      alias: List<String>.from((map['alias'])),
      origin: map['origin'] as String,
      abilities: List<String>.from((map['abilities'])),
      imageUrl: map['img_url'] as String,
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

Future<CharacterModel> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://finalspaceapi.com/api/v0/character/5'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CharacterModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load character');
  }
}
