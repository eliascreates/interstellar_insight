import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:interstellar_insight/core/errors/exception.dart';
import 'package:interstellar_insight/core/network/endpoints.dart';

import '../models/episode_model.dart';

abstract class RemoteEpisodeDataSource {
  Future<List<EpisodeModel>> getAllEpisodes();
  Future<EpisodeModel> getEpisodeById(String id);
}

class RemoteEpisodeDataSourceImpl implements RemoteEpisodeDataSource {
  final http.Client client;

  const RemoteEpisodeDataSourceImpl({required this.client});

  @override
  Future<List<EpisodeModel>> getAllEpisodes() async {
    // TODO: implement getAllEpisodes
    try {
      final response = await client.get(Uri.parse(Endpoints.episodes));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        log('We have the Data: $data');

        final episodes = data
            .map((episodeData) => EpisodeModel.fromMap(episodeData))
            .toList();

        log('We have the EPISODES :-)');
        return episodes;
      } else {
        log('WHOOPS, NO DATA FROM RESPONSE');

        throw ServerException();
      }
    } catch (e) {
      throw ServerException(message: 'Unable to get characters: $e');
    }
  }

  @override
  Future<EpisodeModel> getEpisodeById(String id) async {
    // TODO: implement getEpisodeById
    try {
      final response = await client.get(Uri.parse('${Endpoints.episodes}/$id'));

      final data = jsonDecode(response.body);
      final episode = EpisodeModel.fromMap(data);
      return episode;
    } catch (e) {
      throw ServerException(message: 'Unable to get character of id $id: $e');
    }
  }
}
