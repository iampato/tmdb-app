import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'now_playing_state.dart';
part 'now_playing_cubit.freezed.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final MovieRepository movieRepository;
  NowPlayingCubit({
    required this.movieRepository,
  }) : super(const NowPlayingState.initial());

  Future<void> getNowPlayingMovies() async {
    state.when(
      initial: () async {
        try {
          final movies = await movieRepository.nowPlaying();
          if (movies != null) {
            final moviesModels = MoviesModel.fromDto(movies);
            emit(NowPlayingState.success(
              moviesModel: moviesModels,
              doneFetchingMore: movies.page == movies.totalPages,
              page: movies.page ?? 1,
            ));
          } else {
            emit(const NowPlayingState.error(message: "An error occurred"));
          }
        } catch (e) {
          if (e is DioError) {
            if (e.type == DioErrorType.connectTimeout ||
                e.type == DioErrorType.other) {
              emit(const NowPlayingState.error(
                message: "Check your internet connection",
              ));
            } else if (e.response != null) {
              emit(NowPlayingState.error(
                message:
                    e.response?.data["message"] ?? "A server error occurred",
              ));
            } else {
              emit(const NowPlayingState.error(message: "An error occured"));
            }
          } else {
            emit(NowPlayingState.error(message: e.toString()));
          }
        }
      },
      success: (oldMovies, doneFetchingMore, page, msg) async {
        // pagination
        if (!doneFetchingMore) {
          // fetch more movies
          final movies = await movieRepository.nowPlaying(
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
            emit(NowPlayingState.success(
              moviesModel: newMovies,
              doneFetchingMore: newMovies.page == newMovies.totalPages,
              page: newMovies.page ?? 1,
            ));
          } else {
            emit(NowPlayingState.success(
              moviesModel: oldMovies,
              doneFetchingMore: doneFetchingMore,
              page: page,
              message: "An error occurred",
            ));
          }
        } else {
          emit(NowPlayingState.success(
            moviesModel: oldMovies,
            doneFetchingMore: doneFetchingMore,
            page: page,
          ));
        }
      },
      error: (_) async {
        try {
          final movies = await movieRepository.nowPlaying();
          if (movies != null) {
            final moviesModels = MoviesModel.fromDto(movies);
            emit(NowPlayingState.success(
              moviesModel: moviesModels,
              doneFetchingMore: movies.page == movies.totalPages,
              page: movies.page ?? 1,
            ));
          } else {
            emit(const NowPlayingState.error(message: "An error occurred"));
          }
        } catch (e) {
          if (e is DioError) {
            if (e.type == DioErrorType.connectTimeout ||
                e.type == DioErrorType.other) {
              emit(const NowPlayingState.error(
                message: "Check your internet connection",
              ));
            } else if (e.response != null) {
              emit(NowPlayingState.error(
                message:
                    e.response?.data["message"] ?? "A server error occurred",
              ));
            } else {
              emit(const NowPlayingState.error(message: "An error occured"));
            }
          } else {
            emit(NowPlayingState.error(message: e.toString()));
          }
        }
      },
    );
  }
}
