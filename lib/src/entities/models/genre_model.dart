import 'package:tmdb_app/src/entities/dto/genres_dto.dart';

class GenresModel {
  GenresModel({
    required this.genres,
  });

  List<Genre> genres;

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  factory GenresModel.fromDto(GenresDto dto) => GenresModel(
        genres: List<Genre>.from(dto.genres!.map((x) => Genre.fromDto(x))),
      );
  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  factory Genre.fromDto(GenreDto dt) => Genre(
        id: dt.id!,
        name: dt.name!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
