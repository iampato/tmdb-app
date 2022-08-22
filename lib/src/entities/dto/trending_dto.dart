
import 'package:freezed_annotation/freezed_annotation.dart';

import 'single_movie_dto.dart';
part 'trending_dto.freezed.dart';
part 'trending_dto.g.dart';

@freezed
class TrendingDto with _$TrendingDto {
  const factory TrendingDto({
    int? page,
    required List<SingleMovieDto> results,
    int? totalPages,
    int? totalResults,
  }) = _TrendingDto;

  factory TrendingDto.fromJson(Map<String, dynamic> json) =>
      _$TrendingDtoFromJson(json);
}
