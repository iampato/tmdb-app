// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:tmdb_app/src/entities/dto/movie_credit_dto.dart';
import 'package:tmdb_app/src/utils/app_config.dart';

MovieCreditModel movieCreditModelFromJson(String str) =>
    MovieCreditModel.fromJson(json.decode(str));

String movieCreditModelToJson(MovieCreditModel data) =>
    json.encode(data.toJson());

class MovieCreditModel {
  MovieCreditModel({
    this.id,
    this.cast,
    this.crew,
  });

  int? id;
  List<Cast>? cast;
  List<Cast>? crew;

  factory MovieCreditModel.fromJson(Map<String, dynamic> json) =>
      MovieCreditModel(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  factory MovieCreditModel.fromDto(MovieCreditsDto dto) => MovieCreditModel(
        id: dto.id,
        cast: dto.cast?.map((e) {
          return Cast(
            adult: e.adult,
            creditId: e.creditId,
            id: e.id,
            name: e.name,
            profilePath: e.profilePath,
            department: e.department,
            job: e.job,
            gender: e.gender,
            knownForDepartment: e.knownForDepartment,
            originalName: e.originalName,
            popularity: e.popularity,
          );
        }).toList(),
        crew: dto.crew?.map((e) {
          return Cast(
            adult: e.adult,
            creditId: e.creditId,
            id: e.id,
            name: e.name,
            profilePath: e.profilePath,
            department: e.department,
            job: e.job,
            gender: e.gender,
            knownForDepartment: e.knownForDepartment,
            originalName: e.originalName,
            popularity: e.popularity,
          );
        }).toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": cast == null
            ? null
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? null
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] ?? null,
        creditId: json["credit_id"],
        department: json["department"],
        job: json["job"],
      );

  String get profilePicture => profilePath == null
      ? "https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
      : "${AppConfig.getConfig().imgUrl}/w500$profilePath";

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath ?? null,
        "credit_id": creditId,
        "department": department,
        "job": job,
      };
}
