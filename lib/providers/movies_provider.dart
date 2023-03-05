import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProviders extends ChangeNotifier{


final String _apiKey = '06346bd5142a8959b8b0e8df0606be39';
final String _baseUrl = 'api.themoviedb.org';
final String _language = 'es-ES';
List<Movie> onDisplayMovies = [];
List<Movie> popularMovies  = [];
Map<int, List<Cast>> movieCast = {};

int _popularPage = 0;

  MoviesProviders(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData( String endpoint, [int page = 1] ) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language':_language,
      'page': '$page'
    });

    final response = await http.get(url);
    return response.body;
  }
  getPopularMovies() async {
    
    _popularPage += 1;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final res = popularResponseFromJson(jsonData);
    popularMovies =  [ ...popularMovies, ...res.results ];
    notifyListeners();

  }
  getOnDisplayMovies() async {
  
    final jsonData = await _getJsonData('3/movie/now_playing');
    final res = nowPlayingResponseFromJson(jsonData);
    onDisplayMovies = res.results;
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    
    if(movieCast.containsKey(movieId)){
      return movieCast[movieId]!;
    }

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditResponse = creditResponseFromJson(jsonData);

    movieCast[movieId] = creditResponse.cast;

    return creditResponse.cast;
  }
}