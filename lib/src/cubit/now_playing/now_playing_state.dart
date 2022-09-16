part of 'now_playing_cubit.dart';

@freezed
class NowPlayingState with _$NowPlayingState {
  const factory NowPlayingState.initial() = _Initial;
  const factory NowPlayingState.success({
    required MoviesModel moviesModel,
    required bool doneFetchingMore,
    required int page,
    String? message,
  }) = _Success;
  const factory NowPlayingState.error({
    required String message,
  }) = _Error;
}
