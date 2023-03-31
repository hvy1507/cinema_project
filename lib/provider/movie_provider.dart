import 'package:flutter/cupertino.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';
import 'package:flutter_cinema_app/network/api_request.dart';

class MovieProvider extends ChangeNotifier {
  final _service = ApiRequest();
  Items _detailFilm = Items();
  String _id = "";
  String time = "";
  List<Items> _listNews = [];
  List<Items> get listNews => _listNews;

  String get id => _id;

  Items? get detailFilm => _detailFilm;
  bool isLoading = false;
  List<Items> _listMoviesComing = [];

  List<Items> get listMoviesComing => _listMoviesComing;

  List<Items> _listMoviesFinish = [];

  List<Items> get listMoviesFinish => _listMoviesFinish;

  List<Items> _listMoviesRomance = [];

  List<Items> get listMoviesRomance => _listMoviesRomance;
  List<Items> _listMoviesAdventure = [];

  List<Items> get listMoviesAdventure => _listMoviesAdventure;
  List<Items> _listMoviesComedy = [];

  List<Items> get listMoviesComedy => _listMoviesComedy;
  List<Items> _listMoviesDocumentary = [];

  List<Items> get listMoviesDocumentary => _listMoviesDocumentary;
  List<Items> _listMoviesAction = [];

  List<Items> get listMoviesAction => _listMoviesAction;
  List<Items> _listMoviesScienceFiction = [];

  List<Items> get listMoviesScienceFiction => _listMoviesScienceFiction;
  List<Items> _listMoviesWar = [];

  List<Items> get listMoviesWar => _listMoviesWar;

  Future<List<Items>> getMoviesByType(String type) async {
    isLoading = true;
    notifyListeners();
    List<Items> movieList;
    if (type == "Coming") {
      final response = await _service.fetchStatusData("Coming");
      movieList = response!;
      _listMoviesComing = movieList;
    } else if (type == "Finish") {
      final response = await _service.fetchStatusData("Finish");
      movieList = response!;
      _listMoviesFinish = movieList;
    } else if (type == "Romance") {
      final response = await _service.fetchCategoryData("Romance");
      movieList = response!;
      _listMoviesRomance = movieList;
    } else if (type == "Adventure") {
      final response = await _service.fetchCategoryData("Adventure");
      movieList = response!;
      _listMoviesAdventure = movieList;
    } else if (type == "Comedy") {
      final response = await _service.fetchCategoryData("Comedy");
      movieList = response!;
      _listMoviesComedy = movieList;
    } else if (type == "Documentary") {
      final response = await _service.fetchCategoryData("Documentary");
      movieList = response!;
      _listMoviesDocumentary = movieList;
    } else if (type == "Action") {
      final response = await _service.fetchCategoryData("Action");
      movieList = response!;
      _listMoviesAction = movieList;
    } else if (type == "Science fiction") {
      final response = await _service.fetchCategoryData("Science%20fiction");
      movieList = response!;
      _listMoviesScienceFiction = movieList;
    } else if (type == "War") {
      final response = await _service.fetchCategoryData("War");
      movieList = response!;
      _listMoviesWar = movieList;
    } else {
      throw Exception("Invalid movie type");
    }

    isLoading = false;
    notifyListeners();
    return movieList;
  }

  void getId(String idFilm) async {
    _id = idFilm;
    notifyListeners();
  }

  Future<void> getFilmById() async {
    isLoading = true;
    notifyListeners();
    final response = await ApiRequest.fetchDataFilm(_id);
    _detailFilm = Items.fromJson(response.data);
    getTime();
    isLoading = false;
    notifyListeners();
  }

  void getTime() {
    final startTime = detailFilm?.startTime;
    final endTime = detailFilm?.endTime;
    final start = DateTime.parse(startTime!);
    final end = DateTime.parse(endTime!);
    final diff = end.difference(start);
    final hours = diff.inHours;
    final min = diff.inMinutes %60;
    time ="$hours"'h'" "'$min''m';
  }
  Future<List<Items>> getBanner() async {
    isLoading = true;
    notifyListeners();
    List<Items> movieList;
    final response = await _service.bannerHome();
    movieList = response!;
    _listNews = movieList;
    isLoading = false;
    notifyListeners();
    return movieList;
  }

}
