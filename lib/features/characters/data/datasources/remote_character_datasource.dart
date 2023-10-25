import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:interstellar_insight/core/errors/exception.dart';
import 'package:interstellar_insight/core/network/endpoints.dart';

import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters();
  Future<CharacterModel> getCharacterById(int id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final response = await client.get(Uri.parse(Endpoints.characters));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // log('We got characters data: $data');

        List<CharacterModel> characters = data.map((characterData) {
          return CharacterModel.fromMap(characterData);
        }).toList();

        return characters;
      } else {
        throw ServerException(
          message:
              'Failed to load characters. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw ServerException(message: 'Failed to load characters. Error: $e');
    }
  }

  @override
  Future<CharacterModel> getCharacterById(int id) async {
    final response = await client.get(Uri.parse('${Endpoints.characters}/$id'),
        headers: {'Content-Type': 'application/json; charset=utf-8'});

    if (response.statusCode == 200) {
      final character = CharacterModel.fromMap(jsonDecode(response.body));

      return character;
    } else {
      throw ServerException();
    }
  }
}

//This Data source exists to show the power of clean architecture
class RickMortyCharacterRemoteDataSourceImpl
    implements CharacterRemoteDataSource {
  final http.Client client;

  RickMortyCharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final response = await client
          .get(Uri.parse('https://rickandmortyapi.com/api/character/'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataMap = jsonDecode(response.body);
        final List<dynamic> data = dataMap['results'];

        List<CharacterModel> characters = data.map((characterData) {
          final characterMap = {
            'id': characterData['id'],
            'name': characterData['name'],
            'status': characterData['status'],
            'species': characterData['species'],
            'gender': characterData['gender'],
            'hair': 'Just look at their photo',
            'alias': [],
            'origin': characterData['origin']['name'],
            'abilities': [],
            'img_url': characterData['image'],
          };

          return CharacterModel.fromMap(characterMap);
        }).toList();

        return characters;
      } else {
        throw ServerException(
          message:
              'Failed to load characters. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw ServerException(message: 'Failed to load characters. Error: $e');
    }
  }

  @override
  Future<CharacterModel> getCharacterById(int id) async {
    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/$id'),
        headers: {'Content-Type': 'application/json; charset=utf-8'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> characterData = jsonDecode(response.body);

      final characterMap = {
        'id': characterData['id'],
        'name': characterData['name'],
        'status': characterData['status'],
        'species': characterData['species'],
        'gender': characterData['gender'],
        'hair': 'Just look at their photo',
        'alias': [],
        'origin': characterData['origin']['name'],
        'abilities': [],
        'img_url': characterData['image'],
      };

      final character = CharacterModel.fromMap(characterMap);

      return character;
    } else {
      throw ServerException();
    }
  }
}
