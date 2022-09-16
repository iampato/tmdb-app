import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/styles/adapt.dart';
import 'package:tmdb_app/src/widget/detail/cast_and_crew.dart';
import 'package:tmdb_app/src/widget/detail/detail_backdrop.dart';
import 'package:tmdb_app/src/widget/detail/similar_movies_widget.dart';

class DetailMovieScreen extends StatefulWidget {
  final Results movie;
  const DetailMovieScreen({Key? key, required this.movie}) : super(key: key);

  static const routeName = "detail-movies";

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  Results get movie => widget.movie;
  late ScrollController _scrollController;
  double _offset = 0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        double height = 400;
        double currentOffset = _scrollController.offset;
        if (currentOffset <= 400) {
          setState(() {
            _offset = currentOffset / height;
          });
        }
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: Adapt.setHeight(400),
              floating: false,
              pinned: true,
              snap: false,
              elevation: 0,
              centerTitle: true,
              leadingWidth: Adapt.setWidth(62),
              leading: Transform.translate(
                offset: Offset(-Adapt.setHeight(100) * _offset, 0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 4,
                    bottom: 4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const BackButton(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              actions: [
                Transform.translate(
                  offset: Offset(Adapt.setHeight(195) * _offset, 0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.share),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: Adapt.setWidth(10)),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: Adapt.setWidth(15)),
                    ],
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: DetailBackDrop(
                  imageUrl: movie.largeBackdropImageUrl,
                  title: movie.title ?? "",
                  genreIds: movie.genreIds,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Adapt.setHeight(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "9.4",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Metascore"),
                          Text("54 critic reviews"),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_sharp,
                            size: 25,
                            color: Colors.red,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "8.1",
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
                            "189 Reviews",
                            style: TextStyle(
                              fontSize: Adapt.sp(11),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_outline,
                            size: 30,
                          ),
                          Text("Metascore"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                endIndent: Adapt.setWidth(15),
                indent: Adapt.setWidth(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Adapt.setWidth(17),
                  vertical: Adapt.setHeight(25),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: CachedNetworkImage(
                        height: Adapt.setHeight(160),
                        width: Adapt.setWidth(125),
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
                    SizedBox(
                      width: Adapt.setWidth(25),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Adapt.setHeight(10),
                        ),
                        AnimatedOpacity(
                          opacity: 0.7,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              Text(
                                "Title: ",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                ),
                              ),
                              Text(
                                movie.title ?? "",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adapt.setWidth(4)),
                        AnimatedOpacity(
                          opacity: 0.7,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              Text(
                                "Running Time : ",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                ),
                              ),
                              Text(
                                "1h 46min",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adapt.setWidth(4)),
                        AnimatedOpacity(
                          opacity: 0.7,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              Text(
                                "Release Date : ",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                ),
                              ),
                              Text(
                                "31.08.2017",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adapt.setWidth(4)),
                        AnimatedOpacity(
                          opacity: 0.7,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              Text(
                                "Director : ",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                ),
                              ),
                              Text(
                                "Christopher Nolan",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adapt.setWidth(4)),
                        AnimatedOpacity(
                          opacity: 0.7,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              Text(
                                "Writer : ",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                ),
                              ),
                              Text(
                                "Christopher Nolan",
                                style: TextStyle(
                                  fontSize: Adapt.sp(13),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  "Storyline",
                  style: TextStyle(
                    fontSize: Adapt.sp(16),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 0.95,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Adapt.setWidth(15),
                  right: Adapt.setWidth(15),
                  top: Adapt.setHeight(7),
                  bottom: Adapt.setHeight(15),
                ),
                child: AnimatedOpacity(
                  opacity: 0.7,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    movie.overview ?? "",
                    style: TextStyle(
                      fontSize: Adapt.sp(14),
                      height: 1.3,
                    ),
                  ),
                ),
              ),
              Divider(
                endIndent: Adapt.setWidth(15),
                indent: Adapt.setWidth(15),
              ),
              CastAndCrew(
                id: movie.id,
              ),
              Divider(
                endIndent: Adapt.setWidth(15),
                indent: Adapt.setWidth(15),
              ),
              SimilarMoviesWidget(
                id: movie.id,
                title: movie.title,
              )
            ],
          ),
        ),
      ),
    );
  }
}
