part of 'movie_genres_cubit.dart';

@freezed
class MovieGenresState with _$MovieGenresState {
  const factory MovieGenresState.initial() = _Initial;
  const factory MovieGenresState.success({
    required GenresModel genresModel,
  }) = _Success;
  const factory MovieGenresState.error({
    required String message,
  }) = _Error;
}
