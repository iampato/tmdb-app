import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/src/cubit/similar_movies/similar_movies_cubit.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';
import 'package:tmdb_app/src/styles/adapt.dart';
import 'package:tmdb_app/src/styles/style.dart';
import 'package:tmdb_app/src/utils/debounce_util.dart';
import 'package:tmdb_app/src/widget/bottom_loader.dart';
import 'package:tmdb_app/src/widget/list/list_movie_item.dart';
import 'package:tmdb_app/src/widget/list/movie_list_body.dart';

class SimilarMoviesList extends StatefulWidget {
  final int movieId;
  final String title;
  const SimilarMoviesList(
      {super.key, required this.movieId, required this.title});

  static const routeName = 'similar_movies_list';

  @override
  State<SimilarMoviesList> createState() => _SimilarMoviesListState();
}

class _SimilarMoviesListState extends State<SimilarMoviesList> {
  int get _movieId => widget.movieId;
  String get _title => widget.title;
  late SimilarMoviesCubit _similarMoviesCubit;

  @override
  void initState() {
    _similarMoviesCubit = SimilarMoviesCubit(
      movieRepository: RepositoryProvider.of<MovieRepository>(context),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _similarMoviesCubit.getSimilarMovies(
        movieId: _movieId,
        hardRefresh: true,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _similarMoviesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _similarMoviesCubit,
      child: MovieListBody(
        title: "$_title's similar Movies",
        onFetchMore: () {
          // debounce
          DebounceUtil.debounce(
            'now_playing_paginator',
            Durations.pagination,
            () => _similarMoviesCubit.getSimilarMovies(
              movieId: _movieId,
            ),
          );
        },
        body: BlocConsumer<SimilarMoviesCubit, SimilarMoviesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.when(
              initial: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              success: (movieModels, hasReachedMax, __, ___) {
                if (movieModels.results == null) {
                  return const Center(
                    child: Text('No data'),
                  );
                }
                return ListView.builder(
                  itemCount: hasReachedMax
                      ? movieModels.results!.length
                      : movieModels.results!.length + 1,
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(20),
                    vertical: Adapt.setHeight(15),
                  ),
                  itemBuilder: (context, index) {
                    if (index >= movieModels.results!.length) {
                      return const BottomLoader();
                    }
                    final item = movieModels.results![index];
                    return ListMovieItem(
                      movie: item,
                    );
                  },
                );
              },
              error: (error) {
                return Center(
                  child: Text(error),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
