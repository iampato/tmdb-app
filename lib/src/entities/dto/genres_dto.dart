// To parse this JSON data, do
//
//     final genresDto = genresDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'genres_dto.freezed.dart';
part 'genres_dto.g.dart';

GenresDto genresDtoFromJson(String str) => GenresDto.fromJson(json.decode(str));

String genresDtoToJson(GenresDto data) => json.encode(data.toJson());

@freezed
abstract class GenresDto with _$GenresDto {
  const factory GenresDto({
    List<GenreDto>? genres,
  }) = _GenresDto;

  factory GenresDto.fromJson(Map<String, dynamic> json) =>
      _$GenresDtoFromJson(json);
}

@freezed
abstract class GenreDto with _$GenreDto {
  const factory GenreDto({
    int? id,
    String? name,
  }) = _GenreDto;

  factory GenreDto.fromJson(Map<String, dynamic> json) => _$GenreDtoFromJson(json);
}
