// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PopularMoviesDto _$$_PopularMoviesDtoFromJson(Map<String, dynamic> json) =>
    _$_PopularMoviesDto(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => SingleMovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_PopularMoviesDtoToJson(_$_PopularMoviesDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
