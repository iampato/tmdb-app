
import 'package:freezed_annotation/freezed_annotation.dart';

import 'single_movie_dto.dart';
part 'similiar_dto.freezed.dart';
part 'similiar_dto.g.dart';

@freezed
class SimiliarMoviesDto with _$SimiliarMoviesDto {
  const factory SimiliarMoviesDto({
    int? page,
    required List<SingleMovieDto> results,
    int? totalPages,
    int? totalResults,
  }) = _SimiliarMoviesDto;

  factory SimiliarMoviesDto.fromJson(Map<String, dynamic> json) =>
      _$SimiliarMoviesDtoFromJson(json);
}