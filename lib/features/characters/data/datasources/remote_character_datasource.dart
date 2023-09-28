import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
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
    debugPrint('now we are talking');
    final response = await client.get(Uri.parse(Endpoints.characters));
    debugPrint('we are still okay');

    if (response.statusCode == 200) {
      debugPrint('we are good. we have the data');
      final List<dynamic> data = jsonDecode(response.body);
      log('here is the data: ${data.length}');
      List<CharacterModel> characters = [];
      for (var characterData in data) {
        final map = {
          'id': characterData['id'],
          'name': characterData['name'],
          'status': characterData['status'],
          'species': characterData['species'],
          'gender': characterData['gender'],
          'hair': characterData['hair'],
          'origin': characterData['origin'],
          'img_url': characterData['img_url'],
          'abilities': characterData['abilities'],
        };
        characters.add(CharacterModel.fromMap(map));
      }

      // final characters = List<CharacterModel>.from(data.map<CharacterModel>(
      //     (x) => CharacterModel.fromMap(x as Map<String, dynamic>)));
      // data.map<CharacterModel>((json) => CharacterModel.fromMap(json)).toList();

      log('WE HAVE CHARACTERS - SIZE : ${characters.length}');
      return characters;
    } else {
      debugPrint('looks like we dont have the data');
      throw ServerException(
          message:
              'Failed to load characters. Status code: ${response.statusCode}');
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
