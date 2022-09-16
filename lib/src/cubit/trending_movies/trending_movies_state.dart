part of 'trending_movies_cubit.dart';

@freezed
class TrendingMoviesState with _$TrendingMoviesState {
  const factory TrendingMoviesState.initial() = _Initial;
  const factory TrendingMoviesState.success({
    required MoviesModel moviesModel,
    required bool doneFetchingMore,
    required int page,
    String? message,
  }) = _Success;
  const factory TrendingMoviesState.error({
    required String message,
  }) = _Error;
}
