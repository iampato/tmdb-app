import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/src/cubit/movie_genres/movie_genres_cubit.dart';
import 'package:tmdb_app/src/cubit/now_playing/now_playing_cubit.dart';
import 'package:tmdb_app/src/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:tmdb_app/src/cubit/theme/theme_cubit.dart';
import 'package:tmdb_app/src/cubit/top_rated_movies/top_rated_movies_cubit.dart';
import 'package:tmdb_app/src/cubit/trending_movies/trending_movies_cubit.dart';
import 'package:tmdb_app/src/cubit/upcoming_movies/upcoming_movies_cubit.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';
import 'package:tmdb_app/src/repository/preference_repository.dart';

Widget setupProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      // Theme
      BlocProvider(
        create: (context) {
          return ThemeCubit(
            preferencesRepository: SharedPreferencesRepository(),
          )..decideOnTheme();
        },
      ),
      // Upcomming movies
      BlocProvider(
        create: (context) {
          return UpcomingMoviesCubit(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..getUpcomingMovies();
        },
      ),
      // now playing movies
      BlocProvider(
        create: (context) {
          return NowPlayingCubit(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..getNowPlayingMovies();
        },
      ),
      // trending movies
      BlocProvider(
        create: (context) {
          return TrendingMoviesCubit(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..getTrendingMovies();
        },
      ),
      // popular movies
      BlocProvider(
        create: (context) {
          return PopularMoviesCubit(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..getPopularMovies();
        },
      ),
      // top rated movies
      BlocProvider(
        create: (context) {
          return TopRatedMoviesCubit(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..getTopRatedMovies();
        },
      ),
      // movie genres
      BlocProvider(
        create: (context) {
          return MovieGenresCubit(
            movieRepository: RepositoryProvider.of<MovieRepository>(context),
          )..getMoviesGenres();
        },
      ),
    ],
    child: child,
  );
}
