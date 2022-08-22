
import 'package:freezed_annotation/freezed_annotation.dart';

import 'single_movie_dto.dart';
part 'now_playing_dto.freezed.dart';
part 'now_playing_dto.g.dart';

@freezed
class NowPlayingDto with _$NowPlayingDto {
  const factory NowPlayingDto({
    int? page,
    required List<SingleMovieDto> results,
    int? totalPages,
    int? totalResults,
  }) = _NowPlayingDto;

  factory NowPlayingDto.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingDtoFromJson(json);
}
