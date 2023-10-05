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
