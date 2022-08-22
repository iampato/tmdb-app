// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NowPlayingDto _$$_NowPlayingDtoFromJson(Map<String, dynamic> json) =>
    _$_NowPlayingDto(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => SingleMovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_NowPlayingDtoToJson(_$_NowPlayingDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
