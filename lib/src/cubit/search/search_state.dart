part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.success({
    required MoviesModel moviesModel,
    required bool doneFetchingMore,
    required int page,
    String? message,
  }) = _Success;
  const factory SearchState.error({
    required String message,
  }) = _Error;
}
