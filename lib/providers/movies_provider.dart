import 'package:flutter/material.dart';

class MoviesProviders extends ChangeNotifier{

  MoviesProviders(){
    print('Movies provider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies(){
    print('getOnDisplayMovies');
  }
}