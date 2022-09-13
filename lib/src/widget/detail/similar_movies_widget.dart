import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_app/src/cubit/movie_details/movie_details_cubit.dart';
import 'package:tmdb_app/src/cubit/similar_movies/similar_movies_cubit.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';
import 'package:tmdb_app/src/styles/adapt.dart';
import 'package:tmdb_app/src/widget/detail/similar_movies_list.dart';

class SimilarMoviesWidget extends StatelessWidget {
  final int? id;
  final String? title;
  const SimilarMoviesWidget({
    Key? key,
    this.id,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit(
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..getSimilarMovies(
          movieId: id ?? 1,
          hardRefresh: true,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Adapt.setWidth(15),
              right: Adapt.setWidth(15),
              top: Adapt.setHeight(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Similar Movies",
                  style: TextStyle(
                    fontSize: Adapt.sp(16),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 0.95,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(
                      SimilarMoviesList.routeName,
                      queryParams: {
                        'movieId': id.toString(),
                        'title': title,
                      },
                    );
                  },
                  child: const Text("See all"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Adapt.setWidth(15),
              right: Adapt.setWidth(15),
              top: Adapt.setHeight(15),
              bottom: Adapt.setHeight(30),
            ),
            child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
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
                          return _buildCard(e);
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
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Results movie) {
    return Padding(
      padding: EdgeInsets.only(
        right: Adapt.setWidth(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              height: Adapt.setHeight(150),
              width: Adapt.setWidth(110),
              imageUrl: movie.largePosterImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      Adapt.setWidth(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Adapt.setHeight(7),
              bottom: Adapt.setHeight(3),
            ),
            child: SizedBox(
              width: Adapt.setWidth(115),
              child: Text(
                movie.title ?? "",
                maxLines: 1,
                style: TextStyle(
                  fontSize: Adapt.sp(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
