part of 'upcoming_movies_cubit.dart';

@freezed
class UpcomingMoviesState with _$UpcomingMoviesState {
  const factory UpcomingMoviesState.initial() = _Initial;
  const factory UpcomingMoviesState.success({
    required MoviesModel upcomingMovies,
    required bool doneFetchingMore,
    required int page,
  }) = _Success;
  const factory UpcomingMoviesState.error({
    required String message,
  }) = _Error;
}
