import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_app/src/cubit/now_playing/now_playing_cubit.dart';
import 'package:tmdb_app/src/screens/now_playing_list.dart';
import 'package:tmdb_app/src/widget/home/home_card.dart';
import 'package:tmdb_app/src/widget/home/home_item.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeItem(
      title: "Movies on Theaters",
      onPressed: () {
        GoRouter.of(context).pushNamed(NowPlayingList.routeName);
      },
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
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
