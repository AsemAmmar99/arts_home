import 'dart:convert';
MoviesResponse moviesResponseFromJson(String str) => MoviesResponse.fromJson(json.decode(str));
class MoviesResponse {
  MoviesResponse({
      num? page, 
      List<MoviesResults>? results,
      num? totalPages, 
      num? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  MoviesResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(MoviesResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<MoviesResults>? _results;
  num? _totalPages;
  num? _totalResults;

  num get page => _page ?? 0;
  List<MoviesResults> get results => _results ?? [];
  num get totalPages => _totalPages ?? 0;
  num get totalResults => _totalResults ?? 0;
}

MoviesResults resultsFromJson(String str) => MoviesResults.fromJson(json.decode(str));
class MoviesResults {
  MoviesResults({
      bool? adult, 
      String? backdropPath, 
      List<num>? genreIds, 
      num? id, 
      String? originalLanguage, 
      String? originalTitle, 
      String? overview, 
      num? popularity, 
      String? posterPath, 
      String? releaseDate, 
      String? title, 
      bool? video, 
      num? voteAverage, 
      num? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  MoviesResults.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<num>? _genreIds;
  num? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;

  bool get adult => _adult ?? false;
  String get backdropPath => _backdropPath ?? '';
  List<num> get genreIds => _genreIds ?? [];
  num get id => _id ?? 0;
  String get originalLanguage => _originalLanguage ?? '';
  String get originalTitle => _originalTitle ?? '';
  String get overview => _overview ?? '';
  num get popularity => _popularity ?? 0;
  String get posterPath => _posterPath ?? '';
  String get releaseDate => _releaseDate ?? '';
  String get title => _title ?? '';
  bool get video => _video ?? false;
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;
}