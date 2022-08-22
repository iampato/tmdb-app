// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_credit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieCreditsDto _$MovieCreditsDtoFromJson(Map<String, dynamic> json) {
  return _MovieCreditsDto.fromJson(json);
}

/// @nodoc
mixin _$MovieCreditsDto {
  int? get id => throw _privateConstructorUsedError;
  List<CastDto>? get cast => throw _privateConstructorUsedError;
  List<CastDto>? get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCreditsDtoCopyWith<MovieCreditsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCreditsDtoCopyWith<$Res> {
  factory $MovieCreditsDtoCopyWith(
          MovieCreditsDto value, $Res Function(MovieCreditsDto) then) =
      _$MovieCreditsDtoCopyWithImpl<$Res>;
  $Res call({int? id, List<CastDto>? cast, List<CastDto>? crew});
}

/// @nodoc
class _$MovieCreditsDtoCopyWithImpl<$Res>
    implements $MovieCreditsDtoCopyWith<$Res> {
  _$MovieCreditsDtoCopyWithImpl(this._value, this._then);

  final MovieCreditsDto _value;
  // ignore: unused_field
  final $Res Function(MovieCreditsDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cast = freezed,
    Object? crew = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cast: cast == freezed
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastDto>?,
      crew: crew == freezed
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CastDto>?,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieCreditsDtoCopyWith<$Res>
    implements $MovieCreditsDtoCopyWith<$Res> {
  factory _$$_MovieCreditsDtoCopyWith(
          _$_MovieCreditsDto value, $Res Function(_$_MovieCreditsDto) then) =
      __$$_MovieCreditsDtoCopyWithImpl<$Res>;
  @override
  $Res call({int? id, List<CastDto>? cast, List<CastDto>? crew});
}

/// @nodoc
class __$$_MovieCreditsDtoCopyWithImpl<$Res>
    extends _$MovieCreditsDtoCopyWithImpl<$Res>
    implements _$$_MovieCreditsDtoCopyWith<$Res> {
  __$$_MovieCreditsDtoCopyWithImpl(
      _$_MovieCreditsDto _value, $Res Function(_$_MovieCreditsDto) _then)
      : super(_value, (v) => _then(v as _$_MovieCreditsDto));

  @override
  _$_MovieCreditsDto get _value => super._value as _$_MovieCreditsDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? cast = freezed,
    Object? crew = freezed,
  }) {
    return _then(_$_MovieCreditsDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cast: cast == freezed
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastDto>?,
      crew: crew == freezed
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CastDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieCreditsDto implements _MovieCreditsDto {
  const _$_MovieCreditsDto(
      {this.id, final List<CastDto>? cast, final List<CastDto>? crew})
      : _cast = cast,
        _crew = crew;

  factory _$_MovieCreditsDto.fromJson(Map<String, dynamic> json) =>
      _$$_MovieCreditsDtoFromJson(json);

  @override
  final int? id;
  final List<CastDto>? _cast;
  @override
  List<CastDto>? get cast {
    final value = _cast;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CastDto>? _crew;
  @override
  List<CastDto>? get crew {
    final value = _crew;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovieCreditsDto(id: $id, cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieCreditsDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._cast, _cast) &&
            const DeepCollectionEquality().equals(other._crew, _crew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_cast),
      const DeepCollectionEquality().hash(_crew));

  @JsonKey(ignore: true)
  @override
  _$$_MovieCreditsDtoCopyWith<_$_MovieCreditsDto> get copyWith =>
      __$$_MovieCreditsDtoCopyWithImpl<_$_MovieCreditsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieCreditsDtoToJson(
      this,
    );
  }
}

abstract class _MovieCreditsDto implements MovieCreditsDto {
  const factory _MovieCreditsDto(
      {final int? id,
      final List<CastDto>? cast,
      final List<CastDto>? crew}) = _$_MovieCreditsDto;

  factory _MovieCreditsDto.fromJson(Map<String, dynamic> json) =
      _$_MovieCreditsDto.fromJson;

  @override
  int? get id;
  @override
  List<CastDto>? get cast;
  @override
  List<CastDto>? get crew;
  @override
  @JsonKey(ignore: true)
  _$$_MovieCreditsDtoCopyWith<_$_MovieCreditsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
