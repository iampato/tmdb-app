import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_app/src/entities/models/movie_credits_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'movie_credit_state.dart';
part 'movie_credit_cubit.freezed.dart';

class MovieCreditCubit extends Cubit<MovieCreditState> {
  final MovieRepository movieRepository;
  MovieCreditCubit({
    required this.movieRepository,
  }) : super(const MovieCreditState.initial());

  Future<void> getMovieCredits({required int id}) async {
    try {
      final movieCreditDto = await movieRepository.getMovieCredits(
        movieId: id,
      );
      if (movieCreditDto != null) {
        final movieDetail = MovieCreditModel.fromDto(movieCreditDto);
        emit(MovieCreditState.success(
          movieCreditModel: movieDetail,
        ));
      } else {
        emit(const MovieCreditState.error(message: "An error occurred"));
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.other) {
          emit(const MovieCreditState.error(
            message: "Check your internet connection",
          ));
        } else if (e.response != null) {
          if (e.response?.statusCode == 401) {
            emit(const MovieCreditState.error(
              message: "Invalid API key: You must be granted a valid key.",
            ));
          } else if (e.response?.statusCode == 404) {
            emit(const MovieCreditState.error(
              message: "Movie not found",
            ));
          } else {
            emit(MovieCreditState.error(
              message: e.response?.data["message"] ?? "A server error occurred",
            ));
          }
        } else {
          emit(const MovieCreditState.error(
            message: "An error occured",
          ));
        }
      } else {
        emit(MovieCreditState.error(message: e.toString()));
      }
    }
  }
}
