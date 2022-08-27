part of 'top_rated_movies_cubit.dart';

@freezed
class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState.initial() = _Initial;
  const factory TopRatedMoviesState.success({
    required MoviesModel moviesModel,
    required bool doneFetchingMore,
    required int page,
    String? message,
  }) = _Success;
  const factory TopRatedMoviesState.error({
    required String message,
  }) = _Error;
}
