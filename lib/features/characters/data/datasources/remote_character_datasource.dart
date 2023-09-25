import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:interstellar_insight/core/errors/exception.dart';

import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters();
  Future<CharacterModel> getCharacterById(String id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  CharacterRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await client.get(Uri.parse('$baseUrl/character'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final characters =
          data.map((json) => CharacterModel.fromJson(json)).toList();
      return characters;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CharacterModel> getCharacterById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/character/$id'));

    if (response.statusCode == 200) {
      final character = CharacterModel.fromJson(response.body);

      return character;
    } else {
      throw ServerException();
    }
  }
}
