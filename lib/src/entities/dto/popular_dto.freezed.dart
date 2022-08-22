// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'popular_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PopularMoviesDto _$PopularMoviesDtoFromJson(Map<String, dynamic> json) {
  return _PopularMoviesDto.fromJson(json);
}

/// @nodoc
mixin _$PopularMoviesDto {
  int? get page => throw _privateConstructorUsedError;
  List<SingleMovieDto> get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularMoviesDtoCopyWith<PopularMoviesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularMoviesDtoCopyWith<$Res> {
  factory $PopularMoviesDtoCopyWith(
          PopularMoviesDto value, $Res Function(PopularMoviesDto) then) =
      _$PopularMoviesDtoCopyWithImpl<$Res>;
  $Res call(
      {int? page,
      List<SingleMovieDto> results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class _$PopularMoviesDtoCopyWithImpl<$Res>
    implements $PopularMoviesDtoCopyWith<$Res> {
  _$PopularMoviesDtoCopyWithImpl(this._value, this._then);

  final PopularMoviesDto _value;
  // ignore: unused_field
  final $Res Function(PopularMoviesDto) _then;

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
abstract class _$$_PopularMoviesDtoCopyWith<$Res>
    implements $PopularMoviesDtoCopyWith<$Res> {
  factory _$$_PopularMoviesDtoCopyWith(
          _$_PopularMoviesDto value, $Res Function(_$_PopularMoviesDto) then) =
      __$$_PopularMoviesDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page,
      List<SingleMovieDto> results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class __$$_PopularMoviesDtoCopyWithImpl<$Res>
    extends _$PopularMoviesDtoCopyWithImpl<$Res>
    implements _$$_PopularMoviesDtoCopyWith<$Res> {
  __$$_PopularMoviesDtoCopyWithImpl(
      _$_PopularMoviesDto _value, $Res Function(_$_PopularMoviesDto) _then)
      : super(_value, (v) => _then(v as _$_PopularMoviesDto));

  @override
  _$_PopularMoviesDto get _value => super._value as _$_PopularMoviesDto;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_PopularMoviesDto(
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
class _$_PopularMoviesDto implements _PopularMoviesDto {
  const _$_PopularMoviesDto(
      {this.page,
      required final List<SingleMovieDto> results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_PopularMoviesDto.fromJson(Map<String, dynamic> json) =>
      _$$_PopularMoviesDtoFromJson(json);

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
    return 'PopularMoviesDto(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PopularMoviesDto &&
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
  _$$_PopularMoviesDtoCopyWith<_$_PopularMoviesDto> get copyWith =>
      __$$_PopularMoviesDtoCopyWithImpl<_$_PopularMoviesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PopularMoviesDtoToJson(
      this,
    );
  }
}

abstract class _PopularMoviesDto implements PopularMoviesDto {
  const factory _PopularMoviesDto(
      {final int? page,
      required final List<SingleMovieDto> results,
      final int? totalPages,
      final int? totalResults}) = _$_PopularMoviesDto;

  factory _PopularMoviesDto.fromJson(Map<String, dynamic> json) =
      _$_PopularMoviesDto.fromJson;

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
  _$$_PopularMoviesDtoCopyWith<_$_PopularMoviesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
