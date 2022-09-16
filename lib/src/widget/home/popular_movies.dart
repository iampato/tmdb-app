import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_app/src/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:tmdb_app/src/screens/popular_movies_list.dart';
import 'package:tmdb_app/src/widget/home/home_card.dart';
import 'package:tmdb_app/src/widget/home/home_item.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeItem(
      title: "Popular Movies",
      onPressed: () {
        GoRouter.of(context).pushNamed(PopularMoviesList.routeName);
      },
      child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            success: (movieModels, _, __, ___) {
              final movies = movieModels.results?.take(10).toList();
              if (movies == null) {
                return Container();
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: movies.map((e) {
                    return HomeCard(
                      imageUrl: e.mediumPosterImageUrl,
                      title: e.title ?? "",
                      voteAverage: 0,
                      voteCount: 124,
                    );
                  }).toList(),
                ),
              );
            },
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
