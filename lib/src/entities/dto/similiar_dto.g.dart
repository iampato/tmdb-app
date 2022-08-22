// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similiar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimiliarMoviesDto _$$_SimiliarMoviesDtoFromJson(Map<String, dynamic> json) =>
    _$_SimiliarMoviesDto(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => SingleMovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_SimiliarMoviesDtoToJson(
        _$_SimiliarMoviesDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
