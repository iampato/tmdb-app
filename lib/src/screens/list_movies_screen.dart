import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_app/src/screens/detail_movie_screen.dart';
import 'package:tmdb_app/src/styles/adapt.dart';

class ListMoviesScreen extends StatefulWidget {
  const ListMoviesScreen({Key? key}) : super(key: key);

  static const routeName = "/list-movies";

  @override
  State<ListMoviesScreen> createState() => _ListMoviesScreenState();
}

class _ListMoviesScreenState extends State<ListMoviesScreen> {
  /*
    final _scrollThreshold = 200.0;

  @override
  void initState() {
    props.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    try {
      props.scrollController.removeListener(_scrollListener);
    } catch (e) {
      Logger().e(e);
    }
    super.dispose();
  }

  void _scrollListener() {
    final maxScroll = props.scrollController.position.maxScrollExtent;
    final currentScroll = props.scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      // fetch more data
      props.fetchMore();
    }
  }

  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Movies',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.symmetric(
          horizontal: Adapt.setWidth(15),
          vertical: Adapt.setHeight(15),
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: Adapt.setHeight(17),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailMovieScreen.routeName,
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
                      imageUrl:
                          "https://picsum.photos/id/${index * 24}/300/300",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: Adapt.setWidth(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Adapt.setHeight(10),
                      ),
                      Text(
                        "Moonlight",
                        style: TextStyle(
                          fontSize: Adapt.sp(18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "2h 24min",
                        style: TextStyle(
                          fontSize: Adapt.sp(15),
                        ),
                      ),
                      SizedBox(height: Adapt.setHeight(12)),
                      AnimatedOpacity(
                        opacity: 0.7,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          "Adventure: Drama, Sci-Fi",
                          style: TextStyle(
                            fontSize: Adapt.sp(12),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: 0.7,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          "Director: Ridley Scott",
                          style: TextStyle(
                            fontSize: Adapt.sp(12),
                          ),
                        ),
                      ),
                      SizedBox(height: Adapt.setHeight(12)),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.red,
                          ),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
