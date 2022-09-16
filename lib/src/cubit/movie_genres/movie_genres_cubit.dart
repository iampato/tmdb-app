import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_app/src/entities/models/genre_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'movie_genres_state.dart';
part 'movie_genres_cubit.freezed.dart';

class MovieGenresCubit extends Cubit<MovieGenresState> {
  final MovieRepository movieRepository;
  MovieGenresCubit({
    required this.movieRepository,
  }) : super(const MovieGenresState.initial());

  Future<void> getMoviesGenres() async {
    try {
      final genres = await movieRepository.getMovieGenres();
      if (genres != null) {
        final genresModels = GenresModel.fromDto(genres);
        emit(MovieGenresState.success(
          genresModel: genresModels,
        ));
      } else {
        emit(const MovieGenresState.error(message: "An error occurred"));
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.other) {
          emit(const MovieGenresState.error(
            message: "Check your internet connection",
          ));
        } else if (e.response != null) {
          emit(MovieGenresState.error(
            message: e.response?.data["message"] ?? "A server error occurred",
          ));
        } else {
          emit(const MovieGenresState.error(message: "An error occured"));
        }
      } else {
        emit(MovieGenresState.error(message: e.toString()));
      }
    }
  }

  GenresModel? get movieGenres => state.maybeWhen(
        orElse: () => null,
        success: (genresModel) => genresModel,
      );
}
