import 'dart:convert';
StarsResponse starsResponseFromJson(String str) => StarsResponse.fromJson(json.decode(str));
class StarsResponse {
  StarsResponse({
      num? page, 
      List<StarsResults>? results,
      num? totalPages, 
      num? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  StarsResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(StarsResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<StarsResults>? _results;
  num? _totalPages;
  num? _totalResults;

  num get page => _page ?? 0;
  List<StarsResults> get results => _results ?? [];
  num get totalPages => _totalPages ?? 0;
  num get totalResults => _totalResults ?? 0;
}

StarsResults resultsFromJson(String str) => StarsResults.fromJson(json.decode(str));
class StarsResults {
  StarsResults({
      bool? adult, 
      num? gender, 
      num? id, 
      List<KnownFor>? knownFor, 
      String? knownForDepartment, 
      String? name, 
      num? popularity, 
      String? profilePath,}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _popularity = popularity;
    _profilePath = profilePath;
}

  StarsResults.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
  }
  bool? _adult;
  num? _gender;
  num? _id;
  List<KnownFor>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  num? _popularity;
  String? _profilePath;

  bool get adult => _adult ?? false;
  num get gender => _gender ?? 0;
  num get id => _id ?? 0;
  List<KnownFor> get knownFor => _knownFor ?? [];
  String get knownForDepartment => _knownForDepartment ?? '';
  String get name => _name ?? '';
  num get popularity => _popularity ?? 0;
  String get profilePath => _profilePath ?? '';
}

KnownFor knownForFromJson(String str) => KnownFor.fromJson(json.decode(str));
class KnownFor {
  KnownFor({
      bool? adult, 
      String? backdropPath, 
      List<num>? genreIds, 
      num? id, 
      String? mediaType, 
      String? originalLanguage, 
      String? originalTitle, 
      String? overview, 
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
    _mediaType = mediaType;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  KnownFor.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _mediaType = json['media_type'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
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
  String? _mediaType;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
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
  String get mediaType => _mediaType ?? '';
  String get originalLanguage => _originalLanguage ?? '';
  String get originalTitle => _originalTitle ?? '';
  String get overview => _overview ?? '';
  String get posterPath => _posterPath ?? '';
  String get releaseDate => _releaseDate ?? '';
  String get title => _title ?? '';
  bool get video => _video ?? false;
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;
}