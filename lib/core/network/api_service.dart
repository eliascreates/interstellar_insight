import 'dart:convert';
import 'package:http/http.dart' as http;
import 'endpoints.dart';
import 'exceptions.dart';

class ApiService {
  final http.Client _client;

  ApiService(this._client);

  Future<Map<String, dynamic>> _decodeResponse(http.Response response) async {
    final String responseBody = response.body;

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException('API request failed with status code ${response.statusCode}');
    }

    try {
      return json.decode(responseBody) as Map<String, dynamic>;
    } catch (e) {
      throw ApiException('Failed to parse JSON response: $e');
    }
  }

  Future<Map<String, dynamic>> fetchCharacters() async {
    try {
      final response = await _client.get(Uri.parse(Endpoints.characters));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch characters: $e');
    }
  }

  Future<Map<String, dynamic>> fetchEpisodes() async {
    try {
      final response = await _client.get(Uri.parse(Endpoints.episodes));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch episodes: $e');
    }
  }

  Future<Map<String, dynamic>> fetchLocations() async {
    try {
      final response = await _client.get(Uri.parse(Endpoints.locations));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch locations: $e');
    }
  }

  Future<Map<String, dynamic>> fetchQuotes() async {
    try {
      final response = await _client.get(Uri.parse(Endpoints.quotes));

      return _decodeResponse(response);
    } catch (e) {
      throw NetworkException('Failed to fetch quotes: $e');
    }
  }
}