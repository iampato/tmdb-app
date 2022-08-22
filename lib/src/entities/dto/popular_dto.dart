// To parse this JSON data, do
//
//     final popularMoviesDto = popularMoviesDtoFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'single_movie_dto.dart';
part 'popular_dto.freezed.dart';
part 'popular_dto.g.dart';

@freezed
class PopularMoviesDto with _$PopularMoviesDto {
  const factory PopularMoviesDto({
    int? page,
    required List<SingleMovieDto> results,
    int? totalPages,
    int? totalResults,
  }) = _PopularMoviesDto;

  factory PopularMoviesDto.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesDtoFromJson(json);
}