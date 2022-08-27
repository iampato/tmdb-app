import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'upcoming_movies_cubit.freezed.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  final MovieRepository movieRepository;
  UpcomingMoviesCubit({
    required this.movieRepository,
  }) : super(const UpcomingMoviesState.initial());

  Future<void> getUpcomingMovies() async {
    state.when(
      initial: () async {
        try {
          final movies = await movieRepository.popularMovies();
          if (movies != null) {
            final moviesModels = MoviesModel.fromDto(movies);
            emit(UpcomingMoviesState.success(
              upcomingMovies: moviesModels,
              doneFetchingMore: movies.page == movies.totalPages,
              page: movies.page ?? 1,
            ));
          } else {
            emit(const UpcomingMoviesState.error(message: "An error occurred"));
          }
        } catch (e) {
          if (e is DioError) {
            if (e.type == DioErrorType.connectTimeout ||
                e.type == DioErrorType.other) {
              emit(const UpcomingMoviesState.error(
                message: "Check your internet connection",
              ));
            } else if (e.response != null) {
              emit(UpcomingMoviesState.error(
                message:
                    e.response?.data["message"] ?? "A server error occurred",
              ));
            } else {
              emit(
                  const UpcomingMoviesState.error(message: "An error occured"));
            }
          } else {
            emit(UpcomingMoviesState.error(message: e.toString()));
          }
        }
      },
      success: (oldMovies, doneFetchingMore, page) async {
        // pagination
        if (!doneFetchingMore) {
          // fetch more movies
          final movies = await movieRepository.popularMovies(
            page: page + 1,
          );
          if (movies != null) {
            final moviesModels = MoviesModel.fromDto(movies);
            final results = oldMovies.results!;
            results.addAll(moviesModels.results!);
            final newMovies = MoviesModel(
              results: results,
              page: moviesModels.page,
              totalPages: moviesModels.totalPages,
              totalResults: moviesModels.totalResults,
            );
            emit(UpcomingMoviesState.success(
              upcomingMovies: newMovies,
              doneFetchingMore: newMovies.page == newMovies.totalPages,
              page: newMovies.page ?? 1,
            ));
          } else {
            emit(UpcomingMoviesState.success(
              upcomingMovies: oldMovies,
              doneFetchingMore: doneFetchingMore,
              page: page,
            ));
          }
        } else {
          emit(UpcomingMoviesState.success(
            upcomingMovies: oldMovies,
            doneFetchingMore: doneFetchingMore,
            page: page,
          ));
        }
      },
      error: (_) {},
    );
  }
}
