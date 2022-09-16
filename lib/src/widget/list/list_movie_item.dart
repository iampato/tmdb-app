import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/screens/detail_movie_screen.dart';
import 'package:tmdb_app/src/styles/adapt.dart';
import 'package:shimmer/shimmer.dart';

class ListMovieItem extends StatelessWidget {
  final Results movie;
  const ListMovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Adapt.setHeight(17),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).pushNamed(
            DetailMovieScreen.routeName,
            extra: movie,
            params: {'movieId': movie.id.toString()},
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                height: Adapt.setHeight(210),
                width: Adapt.setWidth(160),
                imageUrl: movie.mediumPosterImageUrl,
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
            SizedBox(
              width: Adapt.setWidth(20),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Adapt.setHeight(10),
                  ),
                  Text(
                    movie.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Adapt.sp(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMEd()
                        .format(movie.releaseDate ?? DateTime.now()),
                    style: TextStyle(
                      fontSize: Adapt.sp(15),
                    ),
                  ),
                  SizedBox(height: Adapt.setHeight(12)),
                  AnimatedOpacity(
                    opacity: 0.7,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Language: ${movie.originalLanguage}",
                      style: TextStyle(
                        fontSize: Adapt.sp(12),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: 0.7,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Budget: ${movie.budget}",
                      style: TextStyle(
                        fontSize: Adapt.sp(12),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: 0.7,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Revenue: ${movie.revenue}",
                      style: TextStyle(
                        fontSize: Adapt.sp(12),
                      ),
                    ),
                  ),
                  SizedBox(height: Adapt.setHeight(12)),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: Adapt.setHeight(30),
                        color: Colors.red,
                      ),
                      Text(
                        movie.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: Adapt.sp(19),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        " /10",
                      ),
                    ],
                  ),
                  Text(
                    "${movie.voteCount} Votes",
                    style: TextStyle(
                      fontSize: Adapt.sp(11),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
