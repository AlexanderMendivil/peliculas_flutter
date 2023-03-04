import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProviders extends ChangeNotifier{


final String _apiKey = '06346bd5142a8959b8b0e8df0606be39';
final String _baseUrl = 'api.themoviedb.org';
final String _language = 'es-ES';
List<Movie> onDisplayMovies = [];
  MoviesProviders(){
    print('Movies provider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language':_language,
      'page': '1'
    });

    final response = await http.get(url);
    final res = nowPlayingResponseFromJson(response.body);
    onDisplayMovies = res.results;
    notifyListeners();
  }
}