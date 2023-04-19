import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:themoviedb/Model/movieModel.dart';
import 'package:themoviedb/Provider/AppConfigs.dart';

class DiscoverMoviesProvider extends ChangeNotifier {
  List<MovieModel?>? _movies = [];
  List<MovieModel?>? get movies => _movies;
  Future fetchMovieModels() async {
    Dio dio = Dio();
    await dio
        .get(
            '${AppConfig().baseUrl}discover/movie?api_key=${AppConfig().moviesKey}&adult=true&language=en-US&page=1')
        .then((value) {
      if (value.statusCode == 200) {
        _movies = DiscoverMoviesModel.fromJson(value.data).results;
      }
    });
    notifyListeners();
  }
}
