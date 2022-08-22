// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrendingDto _$$_TrendingDtoFromJson(Map<String, dynamic> json) =>
    _$_TrendingDto(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => SingleMovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_TrendingDtoToJson(_$_TrendingDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
