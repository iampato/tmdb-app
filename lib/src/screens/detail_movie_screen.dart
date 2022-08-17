import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/src/utils/adapt.dart';

class DetailMovieScreen extends StatelessWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

  static const routeName = "/detail-movies";
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Adapt.setHeight(400),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://picsum.photos/id/34/600",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: Colors.black.withAlpha(100),
                    colorBlendMode: BlendMode.darken,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: Adapt.setHeight(120),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.85],
                          colors: [
                            theme.scaffoldBackgroundColor.withOpacity(0.0),
                            theme.scaffoldBackgroundColor,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Adapt.setWidth(15),
                        ),
                        child: Text(
                          "Murder on the orient express",
                          style: TextStyle(
                            fontSize: Adapt.sp(32),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 0.95,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Adapt.setWidth(15),
                          vertical: Adapt.setHeight(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
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
                                  color: Colors.black54,
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
                                  color: Colors.black54,
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
                                  color: Colors.black54,
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
                                  color: Colors.black54,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: Adapt.setWidth(10),
                                vertical: Adapt.setWidth(5),
                              ),
                              child: Text(
                                "HISTORY",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: Adapt.sp(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Adapt.padTopH() * 0.9,
                    ),
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: AppBar(
                        elevation: 0,
                        iconTheme: const IconThemeData(color: Colors.black),
                        backgroundColor: Colors.transparent,
                        centerTitle: true,
                        title: const Text("TMDB APP"),
                      ),
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
                vertical: Adapt.setHeight(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                      imageUrl: "https://picsum.photos/id/108/300/300",
                      fit: BoxFit.cover,
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
                              "Moonlight",
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
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
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
            Padding(
              padding: EdgeInsets.only(
                left: Adapt.setWidth(15),
                right: Adapt.setWidth(15),
                top: Adapt.setHeight(15),
              ),
              child: Text(
                "Full Cast & Crew",
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
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
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
                              height: Adapt.setHeight(115),
                              width: Adapt.setWidth(115),
                              imageUrl:
                                  "https://picsum.photos/id/${e * 34}/300/300",
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
                                "Fionn Whitehead",
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
                    onPressed: () {},
                    child: const Text("See all"),
                  ),
                ],
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
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
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
                              height: Adapt.setHeight(115),
                              width: Adapt.setWidth(115),
                              imageUrl:
                                  "https://picsum.photos/id/${e * 14}/300/300",
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
                                "Memento",
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
            SizedBox(
              height: Adapt.setHeight(15),
            ),
          ],
        ),
      ),
    );
  }
}
