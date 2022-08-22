// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'now_playing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NowPlayingDto _$NowPlayingDtoFromJson(Map<String, dynamic> json) {
  return _NowPlayingDto.fromJson(json);
}

/// @nodoc
mixin _$NowPlayingDto {
  int? get page => throw _privateConstructorUsedError;
  List<SingleMovieDto> get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NowPlayingDtoCopyWith<NowPlayingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NowPlayingDtoCopyWith<$Res> {
  factory $NowPlayingDtoCopyWith(
          NowPlayingDto value, $Res Function(NowPlayingDto) then) =
      _$NowPlayingDtoCopyWithImpl<$Res>;
  $Res call(
      {int? page,
      List<SingleMovieDto> results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class _$NowPlayingDtoCopyWithImpl<$Res>
    implements $NowPlayingDtoCopyWith<$Res> {
  _$NowPlayingDtoCopyWithImpl(this._value, this._then);

  final NowPlayingDto _value;
  // ignore: unused_field
  final $Res Function(NowPlayingDto) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SingleMovieDto>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_NowPlayingDtoCopyWith<$Res>
    implements $NowPlayingDtoCopyWith<$Res> {
  factory _$$_NowPlayingDtoCopyWith(
          _$_NowPlayingDto value, $Res Function(_$_NowPlayingDto) then) =
      __$$_NowPlayingDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page,
      List<SingleMovieDto> results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class __$$_NowPlayingDtoCopyWithImpl<$Res>
    extends _$NowPlayingDtoCopyWithImpl<$Res>
    implements _$$_NowPlayingDtoCopyWith<$Res> {
  __$$_NowPlayingDtoCopyWithImpl(
      _$_NowPlayingDto _value, $Res Function(_$_NowPlayingDto) _then)
      : super(_value, (v) => _then(v as _$_NowPlayingDto));

  @override
  _$_NowPlayingDto get _value => super._value as _$_NowPlayingDto;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_NowPlayingDto(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SingleMovieDto>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NowPlayingDto implements _NowPlayingDto {
  const _$_NowPlayingDto(
      {this.page,
      required final List<SingleMovieDto> results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_NowPlayingDto.fromJson(Map<String, dynamic> json) =>
      _$$_NowPlayingDtoFromJson(json);

  @override
  final int? page;
  final List<SingleMovieDto> _results;
  @override
  List<SingleMovieDto> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int? totalPages;
  @override
  final int? totalResults;

  @override
  String toString() {
    return 'NowPlayingDto(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NowPlayingDto &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$$_NowPlayingDtoCopyWith<_$_NowPlayingDto> get copyWith =>
      __$$_NowPlayingDtoCopyWithImpl<_$_NowPlayingDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NowPlayingDtoToJson(
      this,
    );
  }
}

abstract class _NowPlayingDto implements NowPlayingDto {
  const factory _NowPlayingDto(
      {final int? page,
      required final List<SingleMovieDto> results,
      final int? totalPages,
      final int? totalResults}) = _$_NowPlayingDto;

  factory _NowPlayingDto.fromJson(Map<String, dynamic> json) =
      _$_NowPlayingDto.fromJson;

  @override
  int? get page;
  @override
  List<SingleMovieDto> get results;
  @override
  int? get totalPages;
  @override
  int? get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_NowPlayingDtoCopyWith<_$_NowPlayingDto> get copyWith =>
      throw _privateConstructorUsedError;
}
