import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_dto.freezed.dart';
part 'cast_dto.g.dart';

@freezed
class CastDto with _$CastDto {
  const factory CastDto({
    bool? adult,
    int? gender,
    int? id,
    @JsonKey(name: 'known_for_department') String? knownForDepartment,
    String? name,
    @JsonKey(name: 'original_name') String? originalName,
    double? popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    String? character,
    @JsonKey(name: 'credit_id') String? creditId,
    int? order,
    String? department,
    String? job,
  }) = _CastDto;

  factory CastDto.fromJson(Map<String, dynamic> json) => _$CastDtoFromJson(json);
}