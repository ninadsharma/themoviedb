import 'package:themoviedb/Model/movieModel.dart';

class SearchModel {
  int? page;
  List<MovieModel?>? results;
  int? totalPages;
  int? totalResults;

  SearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  SearchModel.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <MovieModel>[];
      v.forEach((v) {
        arr0.add(MovieModel.fromJson(v));
      });
      results = arr0;
    }
    totalPages = json['total_pages']?.toInt();
    totalResults = json['total_results']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['results'] = arr0;
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
