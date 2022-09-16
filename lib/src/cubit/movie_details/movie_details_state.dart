part of 'movie_details_cubit.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.error({
    required String message,
  }) = _Error;
  const factory MovieDetailsState.success({
    required Results movie,
  }) = _Success;
}
