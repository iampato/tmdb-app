import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_app/src/cubit/movie_credit/movie_credit_cubit.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';
import 'package:tmdb_app/src/styles/adapt.dart';

class CastAndCrew extends StatelessWidget {
  final int? id;
  const CastAndCrew({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCreditCubit(
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..getMovieCredits(id: id ?? 1),
      child: BlocBuilder<MovieCreditCubit, MovieCreditState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            error: (message) => Text(message),
            success: (movieCreditModel) {
              final cast = movieCreditModel.cast;
              final crew = movieCreditModel.crew;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Adapt.setWidth(15),
                      right: Adapt.setWidth(15),
                      top: Adapt.setHeight(15),
                    ),
                    child: Text(
                      "Full Cast",
                      style: TextStyle(
                        fontSize: Adapt.sp(16),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 0.95,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Adapt.setWidth(15),
                      vertical: Adapt.setHeight(15),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: cast!.map((e) {
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
                                    imageUrl: e.profilePicture,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
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
                                    fit: BoxFit.cover,
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
                                      e.name ?? "",
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
                        }).toList(),
                      ),
                    ),
                  ),
                  Divider(
                    endIndent: Adapt.setWidth(15),
                    indent: Adapt.setWidth(15),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Adapt.setWidth(15),
                      right: Adapt.setWidth(15),
                      top: Adapt.setHeight(15),
                    ),
                    child: Text(
                      "Full Crew",
                      style: TextStyle(
                        fontSize: Adapt.sp(16),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 0.95,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Adapt.setWidth(15),
                      vertical: Adapt.setHeight(15),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: crew!.map((e) {
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
                                    imageUrl: e.profilePicture,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
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
                                    fit: BoxFit.cover,
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
                                      e.name ?? "",
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
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
