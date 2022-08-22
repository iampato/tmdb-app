// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'similiar_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimiliarMoviesDto _$SimiliarMoviesDtoFromJson(Map<String, dynamic> json) {
  return _SimiliarMoviesDto.fromJson(json);
}

/// @nodoc
mixin _$SimiliarMoviesDto {
  int? get page => throw _privateConstructorUsedError;
  List<SingleMovieDto> get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimiliarMoviesDtoCopyWith<SimiliarMoviesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimiliarMoviesDtoCopyWith<$Res> {
  factory $SimiliarMoviesDtoCopyWith(
          SimiliarMoviesDto value, $Res Function(SimiliarMoviesDto) then) =
      _$SimiliarMoviesDtoCopyWithImpl<$Res>;
  $Res call(
      {int? page,
      List<SingleMovieDto> results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class _$SimiliarMoviesDtoCopyWithImpl<$Res>
    implements $SimiliarMoviesDtoCopyWith<$Res> {
  _$SimiliarMoviesDtoCopyWithImpl(this._value, this._then);

  final SimiliarMoviesDto _value;
  // ignore: unused_field
  final $Res Function(SimiliarMoviesDto) _then;

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
abstract class _$$_SimiliarMoviesDtoCopyWith<$Res>
    implements $SimiliarMoviesDtoCopyWith<$Res> {
  factory _$$_SimiliarMoviesDtoCopyWith(_$_SimiliarMoviesDto value,
          $Res Function(_$_SimiliarMoviesDto) then) =
      __$$_SimiliarMoviesDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page,
      List<SingleMovieDto> results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class __$$_SimiliarMoviesDtoCopyWithImpl<$Res>
    extends _$SimiliarMoviesDtoCopyWithImpl<$Res>
    implements _$$_SimiliarMoviesDtoCopyWith<$Res> {
  __$$_SimiliarMoviesDtoCopyWithImpl(
      _$_SimiliarMoviesDto _value, $Res Function(_$_SimiliarMoviesDto) _then)
      : super(_value, (v) => _then(v as _$_SimiliarMoviesDto));

  @override
  _$_SimiliarMoviesDto get _value => super._value as _$_SimiliarMoviesDto;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_SimiliarMoviesDto(
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
class _$_SimiliarMoviesDto implements _SimiliarMoviesDto {
  const _$_SimiliarMoviesDto(
      {this.page,
      required final List<SingleMovieDto> results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_SimiliarMoviesDto.fromJson(Map<String, dynamic> json) =>
      _$$_SimiliarMoviesDtoFromJson(json);

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
    return 'SimiliarMoviesDto(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimiliarMoviesDto &&
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
  _$$_SimiliarMoviesDtoCopyWith<_$_SimiliarMoviesDto> get copyWith =>
      __$$_SimiliarMoviesDtoCopyWithImpl<_$_SimiliarMoviesDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimiliarMoviesDtoToJson(
      this,
    );
  }
}

abstract class _SimiliarMoviesDto implements SimiliarMoviesDto {
  const factory _SimiliarMoviesDto(
      {final int? page,
      required final List<SingleMovieDto> results,
      final int? totalPages,
      final int? totalResults}) = _$_SimiliarMoviesDto;

  factory _SimiliarMoviesDto.fromJson(Map<String, dynamic> json) =
      _$_SimiliarMoviesDto.fromJson;

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
  _$$_SimiliarMoviesDtoCopyWith<_$_SimiliarMoviesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
