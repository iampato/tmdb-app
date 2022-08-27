part of 'popular_movies_cubit.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.initial() = _Initial;
  const factory PopularMoviesState.success({
    required MoviesModel moviesModel,
    required bool doneFetchingMore,
    required int page,
    String? message,
  }) = _Success;
  const factory PopularMoviesState.error({
    required String message,
  }) = _Error;
}
