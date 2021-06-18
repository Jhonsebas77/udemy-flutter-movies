import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_endpoint.dart';

class MoviesProvider {
  String _apiKey = '9d30286b85d5c959f62b788bf92a8bc1';
  String _language = 'es-ES';

  Future<List<Movie>> _makeRequest(Uri url, String decodeValue) async {
    final response = await http.get(url);
    final decodeResponse = json.decode(response.body);
    final movies = Movies.fromJsonList(decodeResponse[decodeValue]);
    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(
      MoviesEndpoint.baseEndpoint,
      MoviesEndpoint.getNowPlaying,
      {
        'api_key': _apiKey,
        'languaje': _language,
      },
    );
    return _makeRequest(url, 'results');
  }

  Future<List<Movie>> getPopular() async {
    final url = Uri.https(
      MoviesEndpoint.baseEndpoint,
      MoviesEndpoint.getPopular,
      {
        'api_key': _apiKey,
        'languaje': _language,
      },
    );
    return _makeRequest(url, 'results');
  }
}
