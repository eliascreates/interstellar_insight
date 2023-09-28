import 'dart:convert';
import 'package:http/http.dart' as http;
import 'endpoints.dart';
import 'exceptions.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<Map<String, dynamic>> _decodeResponse(http.Response response) async {
    final String responseBody = response.body;

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
          'API request failed with status code ${response.statusCode}');
    }

    try {
      return json.decode(responseBody) as Map<String, dynamic>;
    } catch (e) {
      throw ApiException('Failed to parse JSON response: $e');
    }
  }

  Future<List<dynamic>> fetchCharacters() async {
    try {
      final response = await client.get(Uri.parse(Endpoints.characters));

      return _decodeResponse(response) as List<dynamic>;
    } catch (e) {
      throw NetworkException('Failed to fetch characters: $e');
    }
  }

  Future<Map<String, dynamic>> fetchCharacterById(String id) async {
    try {
      final response =
          await client.get(Uri.parse('${Endpoints.characters}/$id'));
      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch a character by this id($id): $e');
    }
  }

  Future<Map<String, dynamic>> fetchEpisodes() async {
    try {
      final response = await client.get(Uri.parse(Endpoints.episodes));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch episodes: $e');
    }
  }

  Future<Map<String, dynamic>> fetchEpisodeById(String id) async {
    try {
      final response = await client.get(Uri.parse('${Endpoints.episodes}/$id'));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch episode by this id($id): $e');
    }
  }

  Future<Map<String, dynamic>> fetchLocations() async {
    try {
      final response = await client.get(Uri.parse(Endpoints.locations));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch locations: $e');
    }
  }

  Future<Map<String, dynamic>> fetchLocationById(String id) async {
    try {
      final response =
          await client.get(Uri.parse('${Endpoints.locations}/$id'));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch a location by this id($id): $e');
    }
  }

  Future<Map<String, dynamic>> fetchQuotes() async {
    try {
      final response = await client.get(Uri.parse(Endpoints.quotes));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch quotes: $e');
    }
  }
}
