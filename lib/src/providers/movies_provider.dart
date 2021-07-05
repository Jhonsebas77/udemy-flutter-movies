import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/actor_model.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_endpoint.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '9d30286b85d5c959f62b788bf92a8bc1';
  String _language = 'es-ES';
  int _popularPage = 0;
  bool _loading = false;
  List<Movie> _popularMovies = new List();
  Map<int, List<Actor>> _movieCast = {};

  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  void disposeStreams() {
    _popularStreamController.close();
  }

  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;

  Stream<List<Movie>> get popularStream => _popularStreamController.stream;

  Future<List<Movie>> _makeRequest(Uri url, String decodeValue) async {
    final response = await http.get(url);
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    final movies = Movies.fromJsonList(decodeResponse[decodeValue]);
    notifyListeners();
    return movies.items;
  }

  Future<List<Actor>> _makeRequestActor(
    Uri url,
    int movieId,
    String decodeValue,
  ) async {
    if (_movieCast.containsKey(movieId)) return _movieCast[movieId];
    final response = await http.get(url);
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    final actors = Actors.fromJsonList(decodeResponse[decodeValue]);
    _movieCast[movieId] = actors.items;
    return actors.items;
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
    if (_loading) return [];
    _loading = true;
    _popularPage++;
    final url = Uri.https(
      MoviesEndpoint.baseEndpoint,
      MoviesEndpoint.getPopular,
      {
        'api_key': _apiKey,
        'languaje': _language,
        'page': _popularPage.toString(),
      },
    );

    final response = await _makeRequest(url, 'results');
    _popularMovies.addAll(response);
    popularSink(_popularMovies);
    _loading = false;
    return response;
  }

  Future<List<Actor>> getActor(
    int movieId,
  ) async {
    final url = Uri.https(
      MoviesEndpoint.baseEndpoint,
      MoviesEndpoint.getCredits(movieId),
      {
        'api_key': _apiKey,
        'languaje': _language,
      },
    );
    return _makeRequestActor(url, movieId, 'cast');
  }

  Future<List<Movie>> findMovie(
    String query,
  ) async {
    final url = Uri.https(
      MoviesEndpoint.baseEndpoint,
      MoviesEndpoint.findMovie,
      {
        'api_key': _apiKey,
        'languaje': _language,
        'query': query,
      },
    );
    return _makeRequest(url, 'results');
  }
}
