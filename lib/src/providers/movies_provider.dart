import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey = '9d30286b85d5c959f62b788bf92a8bc1';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  static const String endpoint_now_playing = '3/movie/now_playing';

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, endpoint_now_playing, {
      'api_key': _apiKey,
      'languaje': _language,
    });
    final response = await http.get(url);
    final decodeResponse = json.decode(response.body);
    final movies = Movies.fromJsonList(decodeResponse['results']);
    return movies.items;
  }
}
