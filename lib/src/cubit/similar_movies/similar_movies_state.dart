part of 'similar_movies_cubit.dart';

@freezed
class SimilarMoviesState with _$SimilarMoviesState {
  const factory SimilarMoviesState.initial() = _Initial;
  const factory SimilarMoviesState.success({
    required MoviesModel moviesModel,
    required bool doneFetchingMore,
    required int page,
    String? message,
  }) = _Success;
  const factory SimilarMoviesState.error({
    required String message,
  }) = _Error;
}
