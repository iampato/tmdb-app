import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'similar_movies_state.dart';
part 'similar_movies_cubit.freezed.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  final MovieRepository movieRepository;
  SimilarMoviesCubit({
    required this.movieRepository,
  }) : super(const SimilarMoviesState.initial());

  Future<void> getSimilarMovies({
    required int movieId,
    hardRefresh = false,
  }) async {
    if (hardRefresh) {
      try {
        final movies = await movieRepository.similiarMovies(
          movieId: movieId,
        );
        if (movies != null) {
          final moviesModels = MoviesModel.fromDto(movies);
          emit(SimilarMoviesState.success(
            moviesModel: moviesModels,
            doneFetchingMore: movies.page == movies.totalPages,
            page: movies.page ?? 1,
          ));
        } else {
          emit(const SimilarMoviesState.error(message: "An error occurred"));
        }
      } catch (e) {
        if (e is DioError) {
          if (e.type == DioErrorType.connectTimeout ||
              e.type == DioErrorType.other) {
            emit(const SimilarMoviesState.error(
              message: "Check your internet connection",
            ));
          } else if (e.response != null) {
            emit(SimilarMoviesState.error(
              message: e.response?.data["message"] ?? "A server error occurred",
            ));
          } else if (e.response?.statusCode == 404) {
            Logger().i(e.requestOptions.uri.toString());
            emit(SimilarMoviesState.error(
              message: e.response?.data["message"] ?? "A server error occurred",
            ));
          } else {
            emit(const SimilarMoviesState.error(message: "An error occured"));
          }
        } else {
          emit(SimilarMoviesState.error(message: e.toString()));
        }
      }
    } else {
      state.when(
        initial: () async {
          try {
            final movies = await movieRepository.similiarMovies(
              movieId: movieId,
            );
            if (movies != null) {
              final moviesModels = MoviesModel.fromDto(movies);
              emit(SimilarMoviesState.success(
                moviesModel: moviesModels,
                doneFetchingMore: movies.page == movies.totalPages,
                page: movies.page ?? 1,
              ));
            } else {
              emit(
                  const SimilarMoviesState.error(message: "An error occurred"));
            }
          } catch (e) {
            if (e is DioError) {
              if (e.type == DioErrorType.connectTimeout ||
                  e.type == DioErrorType.other) {
                emit(const SimilarMoviesState.error(
                  message: "Check your internet connection",
                ));
              } else if (e.response != null) {
                emit(SimilarMoviesState.error(
                  message:
                      e.response?.data["message"] ?? "A server error occurred",
                ));
              } else {
                emit(const SimilarMoviesState.error(
                    message: "An error occured"));
              }
            } else {
              emit(SimilarMoviesState.error(message: e.toString()));
            }
          }
        },
        success: (oldMovies, doneFetchingMore, page, msg) async {
          // pagination
          if (!doneFetchingMore) {
            // fetch more movies
            final movies = await movieRepository.similiarMovies(
              movieId: movieId,
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
              emit(SimilarMoviesState.success(
                moviesModel: newMovies,
                doneFetchingMore: newMovies.page == newMovies.totalPages,
                page: newMovies.page ?? 1,
              ));
            } else {
              emit(SimilarMoviesState.success(
                moviesModel: oldMovies,
                doneFetchingMore: doneFetchingMore,
                page: page,
                message: "An error occurred",
              ));
            }
          } else {
            emit(SimilarMoviesState.success(
              moviesModel: oldMovies,
              doneFetchingMore: doneFetchingMore,
              page: page,
            ));
          }
        },
        error: (_) async {
          try {
            final movies = await movieRepository.similiarMovies(
              movieId: movieId,
            );
            if (movies != null) {
              final moviesModels = MoviesModel.fromDto(movies);
              emit(SimilarMoviesState.success(
                moviesModel: moviesModels,
                doneFetchingMore: movies.page == movies.totalPages,
                page: movies.page ?? 1,
              ));
            } else {
              emit(
                  const SimilarMoviesState.error(message: "An error occurred"));
            }
          } catch (e) {
            if (e is DioError) {
              if (e.type == DioErrorType.connectTimeout ||
                  e.type == DioErrorType.other) {
                emit(const SimilarMoviesState.error(
                  message: "Check your internet connection",
                ));
              } else if (e.response != null) {
                emit(SimilarMoviesState.error(
                  message:
                      e.response?.data["message"] ?? "A server error occurred",
                ));
              } else {
                emit(const SimilarMoviesState.error(
                    message: "An error occured"));
              }
            } else {
              emit(SimilarMoviesState.error(message: e.toString()));
            }
          }
        },
      );
    }
  }
}
