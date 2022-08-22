// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopRatedDto _$$_TopRatedDtoFromJson(Map<String, dynamic> json) =>
    _$_TopRatedDto(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => SingleMovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_TopRatedDtoToJson(_$_TopRatedDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
