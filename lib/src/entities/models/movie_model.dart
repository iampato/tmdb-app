import 'package:tmdb_app/src/entities/dto/movie_dto.dart';
import 'package:tmdb_app/src/utils/app_config.dart';

class MoviesModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MoviesModel({this.page, this.results, this.totalPages, this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  MoviesModel.fromDto(MovieDto dto) {
    page = dto.page;
    results = dto.results.map((e) {
      return Results(
        adult: e.adult,
        backdropPath: e.backdropPath,
        id: e.id,
        originalLanguage: e.originalLanguage,
        originalTitle: e.originalTitle,
        overview: e.overview,
        popularity: e.popularity,
        posterPath: e.posterPath,
        releaseDate: e.releaseDate,
        title: e.title,
        video: e.video,
        voteAverage: e.voteAverage,
        voteCount: e.voteCount,
      );
    }).toList();
    totalPages = dto.totalPages;
    totalResults = dto.totalResults;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  int? budget;
  int? revenue;
  String? homepage;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.budget,
    this.revenue,
    this.homepage,
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

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    budget = json['budget'];
    revenue = json['revenue'];
    homepage = json['homepage'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['budget'] = budget;
    data['revenue'] = revenue;
    data['homepage'] = homepage;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
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

  // backdrop image url
  String get smallBackdropImageUrl {
    return "${AppConfig.getConfig().imgUrl}/w92$backdropPath";
  }

  String get mediumBackdropImageUrl {
    return "${AppConfig.getConfig().imgUrl}/w185$backdropPath";
  }

  String get largeBackdropImageUrl {
    return "${AppConfig.getConfig().imgUrl}/w500$backdropPath";
  }

  String get originalBackdropImageUrl {
    return "${AppConfig.getConfig().imgUrl}/original$backdropPath";
  }

  // poster image url
  String get smallPosterImageUrl {
    return "${AppConfig.getConfig().imgUrl}/w92$posterPath";
  }

  String get mediumPosterImageUrl {
    return "${AppConfig.getConfig().imgUrl}/w185$posterPath";
  }

  String get largePosterImageUrl {
    return "${AppConfig.getConfig().imgUrl}/w500$posterPath";
  }
}
