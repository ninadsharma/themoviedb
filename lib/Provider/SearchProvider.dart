import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:themoviedb/Model/SearchModel.dart';
import 'package:themoviedb/Model/movieModel.dart';
import 'package:themoviedb/Provider/AppConfigs.dart';

class SearchMoviesProvider extends ChangeNotifier {
  List<MovieModel?>? _searchedMovies = [];
  List<MovieModel?>? get searchedMovies => _searchedMovies;

  Future<void> searchMovies(String searchText) async {
    if (searchText.trim().isEmpty) {
      return;
    }

    String encodedSearchText = Uri.encodeQueryComponent(searchText.trim());

    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '${AppConfig().baseUrl}search/movie?api_key=${AppConfig().moviesKey}&query=$encodedSearchText&page=1');
      if (response.statusCode == 200 && response.data != null) {
        _searchedMovies = SearchModel.fromJson(response.data).results;
      } else {
        _searchedMovies = [];
      }
    } catch (e) {
      _searchedMovies = [];
    }
    notifyListeners();
  }
}
