import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';
import 'package:flutter_cinema_app/network/api_request.dart';

class SearchProvider extends ChangeNotifier {
  //Top-Search
  final _service = ApiRequest();
  bool isLoading = false;
  List<Items> _listMovies = [];
  List<Items> get listMovies => _listMovies;
  Future<void> getAllMovies() async {
    isLoading = true;
    notifyListeners();
    final respone = await _service.fetchData();
    _listMovies = respone!;
    _foundMovie = _listMovies;
    isLoading = false;
    notifyListeners();
  }

  List<Items> _foundMovie = [];
  List<Items> get foundMovie => _foundMovie;

  void searchMovies(String keyword) {
    if (keyword.isEmpty) {
      _foundMovie = _listMovies;
    } else {
      _foundMovie = _listMovies
          .where((movie) =>
              movie.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  //See-more search
  List<Items> _listMoviesTitle = [];
  List<Items> get listMoviesTitle => _listMoviesTitle;

  List<Items> _foundMovieTitle = [];
  List<Items> get foundMovieTitle => _foundMovieTitle;

  Future<void> listMoviesTitleData(List<Items> list) async {
    _listMoviesTitle = list;
    _foundMovieTitle = _listMoviesTitle;
    notifyListeners();
  }

  void searchMovieTitle(String keyword) {
    if (keyword.isEmpty) {
      _foundMovieTitle = _listMoviesTitle;
    } else {
      _foundMovieTitle = _listMoviesTitle
          .where((movie) =>
              movie.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
}
