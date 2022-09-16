import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'movie_details_state.dart';
part 'movie_details_cubit.freezed.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository movieRepository;
  MovieDetailsCubit({
    required this.movieRepository,
  }) : super(const MovieDetailsState.initial());

  Future<void> getMovieDetails({required int id}) async {
    try {
      final movie = await movieRepository.getMovieDetail(
        movieId: id,
      );
      if (movie != null) {
        final movieModel = Results.fromDto(movie);
        emit(MovieDetailsState.success(
          movie: movieModel,
        ));
      } else {
        emit(const MovieDetailsState.error(message: "An error occurred"));
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.other) {
          emit(const MovieDetailsState.error(
            message: "Check your internet connection",
          ));
        } else if (e.response != null) {
          emit(MovieDetailsState.error(
            message: e.response?.data["message"] ?? "A server error occurred",
          ));
        } else {
          emit(const MovieDetailsState.error(message: "An error occured"));
        }
      } else {
        emit(MovieDetailsState.error(message: e.toString()));
      }
    }
  }
}
