import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/src/cubit/upcoming_movies/upcoming_movies_cubit.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';

import 'package:tmdb_app/src/styles/adapt.dart';

class HomeBackdrop extends StatefulWidget {
  final double height;
  final ScrollController scrollController;
  const HomeBackdrop({
    Key? key,
    required this.height,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<HomeBackdrop> createState() => _HomeBackdropState();
}

class _HomeBackdropState extends State<HomeBackdrop> {
  Timer? _timer;
  int _index = 0;
  ScrollController get _controller => widget.scrollController;
  double get _height => widget.height;
  double _scale = 1.0;
  double _offset = 0;

  @override
  void initState() {
    _controller.addListener(_imageScroll);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.removeListener(_imageScroll);
    super.dispose();
  }

  void _imageScroll() {
    double currentOffset = _controller.offset;
    if (currentOffset <= _height) {
      double ratio = (currentOffset / _height) / 2.58; //2.25;
      setState(() {
        _scale = 1 + ratio;
        _offset = currentOffset / _height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adapt.setHeight(_height),
      child: BlocConsumer<UpcomingMoviesCubit, UpcomingMoviesState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (movies, __) {
              _timer = Timer.periodic(
                const Duration(seconds: 15),
                (_) {
                  if (_index != movies.results?.length) {
                    setState(() {
                      _index++;
                    });
                  } else {
                    _index = 0;
                  }
                },
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            success: (movies, doneFetchingMore) => _buildSuccess(movies),
            error: (message) => _buildError(message),
            orElse: () => _buildLoading(),
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildSuccess(MoviesModel movies) {
    return Stack(
      children: [
        Transform.scale(
          scale: _scale,
          child: CachedNetworkImage(
            imageUrl: movies.results![_index].largeBackdropImageUrl,
            height: double.infinity,
            width: double.infinity,
            colorBlendMode: BlendMode.darken,
            color: Colors.black.withAlpha(50),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.translate(
                offset: Offset(
                  (_offset * 10) * -Adapt.setWidth(30),
                  0,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(15),
                  ),
                  child: Text(
                    //"Murder on the orient express",
                    movies.results![_index].title?.trim() ?? "",
                    style: TextStyle(
                      fontSize: Adapt.sp(28),
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      height: 0.95,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(
                  (_offset * 10) * Adapt.setWidth(50),
                  0,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(15),
                    vertical: Adapt.setHeight(10),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [1, 2, 4, 3, 5].map((e) {
                          return const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.red,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        width: Adapt.setWidth(10),
                      ),
                      Text(
                        "${movies.results![_index].voteCount} Votes",
                        style: TextStyle(
                          fontSize: Adapt.sp(14.5),
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(
                  0,
                  (_offset * 10) * Adapt.setHeight(50),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: Adapt.setWidth(10),
                          vertical: Adapt.setWidth(5),
                        ),
                        child: Text(
                          "THRILLER",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: Adapt.sp(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Adapt.setWidth(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: Adapt.setWidth(10),
                          vertical: Adapt.setWidth(5),
                        ),
                        child: Text(
                          "ACTION",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: Adapt.sp(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Adapt.setHeight(30),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Adapt.padTopH() * 0.9,
          ),
          child: SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text("TMDB APP"),
            ),
          ),
        ),
      ],
    );
  }
}
