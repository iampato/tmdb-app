// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genres_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenresDto _$GenresDtoFromJson(Map<String, dynamic> json) {
  return _GenresDto.fromJson(json);
}

/// @nodoc
mixin _$GenresDto {
  List<GenreDto>? get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenresDtoCopyWith<GenresDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresDtoCopyWith<$Res> {
  factory $GenresDtoCopyWith(GenresDto value, $Res Function(GenresDto) then) =
      _$GenresDtoCopyWithImpl<$Res>;
  $Res call({List<GenreDto>? genres});
}

/// @nodoc
class _$GenresDtoCopyWithImpl<$Res> implements $GenresDtoCopyWith<$Res> {
  _$GenresDtoCopyWithImpl(this._value, this._then);

  final GenresDto _value;
  // ignore: unused_field
  final $Res Function(GenresDto) _then;

  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreDto>?,
    ));
  }
}

/// @nodoc
abstract class _$$_GenresDtoCopyWith<$Res> implements $GenresDtoCopyWith<$Res> {
  factory _$$_GenresDtoCopyWith(
          _$_GenresDto value, $Res Function(_$_GenresDto) then) =
      __$$_GenresDtoCopyWithImpl<$Res>;
  @override
  $Res call({List<GenreDto>? genres});
}

/// @nodoc
class __$$_GenresDtoCopyWithImpl<$Res> extends _$GenresDtoCopyWithImpl<$Res>
    implements _$$_GenresDtoCopyWith<$Res> {
  __$$_GenresDtoCopyWithImpl(
      _$_GenresDto _value, $Res Function(_$_GenresDto) _then)
      : super(_value, (v) => _then(v as _$_GenresDto));

  @override
  _$_GenresDto get _value => super._value as _$_GenresDto;

  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_$_GenresDto(
      genres: genres == freezed
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenresDto implements _GenresDto {
  const _$_GenresDto({final List<GenreDto>? genres}) : _genres = genres;

  factory _$_GenresDto.fromJson(Map<String, dynamic> json) =>
      _$$_GenresDtoFromJson(json);

  final List<GenreDto>? _genres;
  @override
  List<GenreDto>? get genres {
    final value = _genres;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenresDto(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenresDto &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  _$$_GenresDtoCopyWith<_$_GenresDto> get copyWith =>
      __$$_GenresDtoCopyWithImpl<_$_GenresDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenresDtoToJson(
      this,
    );
  }
}

abstract class _GenresDto implements GenresDto {
  const factory _GenresDto({final List<GenreDto>? genres}) = _$_GenresDto;

  factory _GenresDto.fromJson(Map<String, dynamic> json) =
      _$_GenresDto.fromJson;

  @override
  List<GenreDto>? get genres;
  @override
  @JsonKey(ignore: true)
  _$$_GenresDtoCopyWith<_$_GenresDto> get copyWith =>
      throw _privateConstructorUsedError;
}

GenreDto _$GenreDtoFromJson(Map<String, dynamic> json) {
  return _GenreDto.fromJson(json);
}

/// @nodoc
mixin _$GenreDto {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreDtoCopyWith<GenreDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreDtoCopyWith<$Res> {
  factory $GenreDtoCopyWith(GenreDto value, $Res Function(GenreDto) then) =
      _$GenreDtoCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$GenreDtoCopyWithImpl<$Res> implements $GenreDtoCopyWith<$Res> {
  _$GenreDtoCopyWithImpl(this._value, this._then);

  final GenreDto _value;
  // ignore: unused_field
  final $Res Function(GenreDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GenreDtoCopyWith<$Res> implements $GenreDtoCopyWith<$Res> {
  factory _$$_GenreDtoCopyWith(
          _$_GenreDto value, $Res Function(_$_GenreDto) then) =
      __$$_GenreDtoCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_GenreDtoCopyWithImpl<$Res> extends _$GenreDtoCopyWithImpl<$Res>
    implements _$$_GenreDtoCopyWith<$Res> {
  __$$_GenreDtoCopyWithImpl(
      _$_GenreDto _value, $Res Function(_$_GenreDto) _then)
      : super(_value, (v) => _then(v as _$_GenreDto));

  @override
  _$_GenreDto get _value => super._value as _$_GenreDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_GenreDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenreDto implements _GenreDto {
  const _$_GenreDto({this.id, this.name});

  factory _$_GenreDto.fromJson(Map<String, dynamic> json) =>
      _$$_GenreDtoFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'GenreDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenreDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_GenreDtoCopyWith<_$_GenreDto> get copyWith =>
      __$$_GenreDtoCopyWithImpl<_$_GenreDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreDtoToJson(
      this,
    );
  }
}

abstract class _GenreDto implements GenreDto {
  const factory _GenreDto({final int? id, final String? name}) = _$_GenreDto;

  factory _GenreDto.fromJson(Map<String, dynamic> json) = _$_GenreDto.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_GenreDtoCopyWith<_$_GenreDto> get copyWith =>
      throw _privateConstructorUsedError;
}
