// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenresDto _$$_GenresDtoFromJson(Map<String, dynamic> json) => _$_GenresDto(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GenresDtoToJson(_$_GenresDto instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

_$_GenreDto _$$_GenreDtoFromJson(Map<String, dynamic> json) => _$_GenreDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_GenreDtoToJson(_$_GenreDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
