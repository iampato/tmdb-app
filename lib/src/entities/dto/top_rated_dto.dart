
import 'package:freezed_annotation/freezed_annotation.dart';

import 'single_movie_dto.dart';
part 'top_rated_dto.freezed.dart';
part 'top_rated_dto.g.dart';

@freezed
class TopRatedDto with _$TopRatedDto {
  const factory TopRatedDto({
    int? page,
    required List<SingleMovieDto> results,
    int? totalPages,
    int? totalResults,
  }) = _TopRatedDto;

  factory TopRatedDto.fromJson(Map<String, dynamic> json) =>
      _$TopRatedDtoFromJson(json);
}
