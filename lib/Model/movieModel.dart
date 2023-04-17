class MovieModel {
  bool? adult;
  String? backdropPath;
  List<int?>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  int? voteAverage;
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
    if (json['genre_ids'] != null) {
      final v = json['genre_ids'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      genreIds = arr0;
    }
    id = json['id']?.toInt();
    originalLanguage = json['original_language']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path']?.toString();
    releaseDate = json['release_date']?.toString();
    title = json['title']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toInt();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['genre_ids'] = arr0;
    }
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class DiscoverMoviesModel {
  int? page;
  List<MovieModel?>? results;
  int? totalPages;
  int? totalResults;

  DiscoverMoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  DiscoverMoviesModel.fromJson(Map<String, dynamic> json) {
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
