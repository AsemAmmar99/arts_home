import 'dart:convert';
TvShowsResponse tvShowsResponseFromJson(String str) => TvShowsResponse.fromJson(json.decode(str));
class TvShowsResponse {
  TvShowsResponse({
      num? page, 
      List<TvShowsResults>? results,
      num? totalPages, 
      num? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  TvShowsResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(TvShowsResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<TvShowsResults>? _results;
  num? _totalPages;
  num? _totalResults;

  num get page => _page ?? 0;
  List<TvShowsResults> get results => _results ?? [];
  num get totalPages => _totalPages ?? 0;
  num get totalResults => _totalResults ?? 0;

}

TvShowsResults resultsFromJson(String str) => TvShowsResults.fromJson(json.decode(str));
class TvShowsResults {
  TvShowsResults({
      String? backdropPath, 
      String? firstAirDate, 
      List<num>? genreIds, 
      num? id, 
      String? name, 
      List<String>? originCountry, 
      String? originalLanguage, 
      String? originalName, 
      String? overview, 
      num? popularity, 
      String? posterPath, 
      num? voteAverage, 
      num? voteCount,}){
    _backdropPath = backdropPath;
    _firstAirDate = firstAirDate;
    _genreIds = genreIds;
    _id = id;
    _name = name;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  TvShowsResults.fromJson(dynamic json) {
    _backdropPath = json['backdrop_path'];
    _firstAirDate = json['first_air_date'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _name = json['name'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  String? _backdropPath;
  String? _firstAirDate;
  List<num>? _genreIds;
  num? _id;
  String? _name;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  num? _voteAverage;
  num? _voteCount;

  String get backdropPath => _backdropPath ?? '';
  String get firstAirDate => _firstAirDate ?? '';
  List<num> get genreIds => _genreIds ?? [];
  num get id => _id ?? 0;
  String get name => _name ?? '';
  List<String> get originCountry => _originCountry ?? [];
  String get originalLanguage => _originalLanguage ?? '';
  String get originalName => _originalName ?? '';
  String get overview => _overview ?? '';
  num get popularity => _popularity ?? 0;
  String get posterPath => _posterPath ?? '';
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;
}