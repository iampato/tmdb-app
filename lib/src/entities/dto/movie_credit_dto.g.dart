// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieCreditsDto _$$_MovieCreditsDtoFromJson(Map<String, dynamic> json) =>
    _$_MovieCreditsDto(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => CastDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieCreditsDtoToJson(_$_MovieCreditsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
