import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/src/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:tmdb_app/src/styles/adapt.dart';
import 'package:tmdb_app/src/styles/style.dart';
import 'package:tmdb_app/src/utils/debounce_util.dart';
import 'package:tmdb_app/src/widget/bottom_loader.dart';
import 'package:tmdb_app/src/widget/list/movie_list_body.dart';

import '../widget/list/list_movie_item.dart';

class PopularMoviesList extends StatefulWidget {
  const PopularMoviesList({super.key});

  static const routeName = 'popular_movies_list';

  @override
  State<PopularMoviesList> createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  void _onPagination() {
    // debounce
    DebounceUtil.debounce(
      'now_playing_paginator',
      Durations.pagination,
      () => context.read<PopularMoviesCubit>().getPopularMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MovieListBody(
      title: 'Popular Movies',
      onFetchMore: _onPagination,
      body: BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
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
    );
  }
}
