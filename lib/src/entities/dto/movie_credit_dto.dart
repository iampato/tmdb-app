import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:tmdb_app/src/entities/dto/cast_dto.dart';

part 'movie_credit_dto.freezed.dart';
part 'movie_credit_dto.g.dart';

MovieCreditsDto movieCreditsDtoFromJson(String str) =>
    MovieCreditsDto.fromJson(json.decode(str));

String movieCreditsDtoToJson(MovieCreditsDto data) =>
    json.encode(data.toJson());

@freezed
class MovieCreditsDto with _$MovieCreditsDto {
  const factory MovieCreditsDto({
    int? id,
    List<CastDto>? cast,
    List<CastDto>? crew,
  }) = _MovieCreditsDto;

  factory MovieCreditsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsDtoFromJson(json);
}
