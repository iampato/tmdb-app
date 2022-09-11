part of 'movie_credit_cubit.dart';

@freezed
class MovieCreditState with _$MovieCreditState {
  const factory MovieCreditState.initial() = _Initial;
  const factory MovieCreditState.success({
    required MovieCreditModel movieCreditModel,
  }) = _Success;
  const factory MovieCreditState.error({
    required String message,
  }) = _Error;
}
