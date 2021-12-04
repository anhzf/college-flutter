import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieService {
  static const _baseUrl = 'api.themoviedb.org';
  static const _basePath = '/3';
  static final _baseQuery = {
    'api_key': dotenv.env['MOVIEDB_APIKEY'],
    'language': 'en-US',
  };

  static Future<List<Movie>> getUpcoming() async {
    const endpoint = '/movie/upcoming';
    final url = Uri.https(_baseUrl, '$_basePath$endpoint', _baseQuery);
    final result = await http.get(url);

    return _parseApiResponse(result);
  }

  static Future<List<Movie>> find(String title) async {
    const endpoint = '/search/movie';
    final url = Uri.https(_baseUrl, '$_basePath$endpoint', {
      ..._baseQuery,
      'query': title,
    });
    final result = await http.get(url);

    return _parseApiResponse(result);
  }

  static List<Movie> _parseApiResponse(http.Response res) {
    if (res.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(res.body);
      final data = jsonResponse['results'];

      return data.map<Movie>((i) => Movie.fromMap(i)).toList();
    }

    return [];
  }
}
