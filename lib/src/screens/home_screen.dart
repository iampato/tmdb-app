import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/src/screens/list_movies_screen.dart';
import 'package:tmdb_app/src/utils/adapt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _startScroll = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _onStartScroll(ScrollMetrics metrics) {
    if (mounted) {
      setState(() {
        _startScroll = metrics.pixels;
      });
    }
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    print("UPDATE SCROLL");
  }

  _onEndScroll(ScrollMetrics metrics) {
    /*
    0 -> 286
    */
    // scroll percentage
    final intialScroll = ((_startScroll / metrics.maxScrollExtent) * 100);
    final endScroll = ((metrics.pixels / metrics.maxScrollExtent) * 100);
    if (endScroll < intialScroll) {
      if (metrics.pixels > 0 && metrics.pixels <= 185) {
        Future.delayed(const Duration(milliseconds: 100), () {}).then((s) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
      }
    } else {
      if (metrics.pixels > 100 && metrics.pixels <= 286) {
        Future.delayed(const Duration(milliseconds: 100), () {}).then((s) {
          _scrollController.animateTo(
            286,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Adapt.setHeight(350),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "https://picsum.photos/600",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Adapt.setWidth(15),
                        ),
                        child: Text(
                          "Murder on the orient express",
                          style: TextStyle(
                            fontSize: Adapt.sp(28),
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            height: 0.95,
                          ),
                        ),
                      ),
                      Padding(
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
                              "189 Reviews",
                              style: TextStyle(
                                fontSize: Adapt.sp(14.5),
                                color: Colors.white70,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
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
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                _onStartScroll(scrollNotification.metrics);
              } else if (scrollNotification is ScrollUpdateNotification) {
                _onUpdateScroll(scrollNotification.metrics);
              } else if (scrollNotification is ScrollEndNotification) {
                _onEndScroll(scrollNotification.metrics);
              }
              return false;
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(height: Adapt.setHeight(329)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Adapt.setWidth(20)),
                        topRight: Radius.circular(Adapt.setWidth(20)),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: Adapt.padTopH(),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: Adapt.setWidth(15),
                            right: Adapt.setWidth(15),
                            bottom: Adapt.setHeight(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Movies on theater",
                                style: TextStyle(
                                  fontSize: Adapt.sp(17),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    ListMoviesScreen.routeName,
                                  );
                                },
                                child: const Text("SEE ALL"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Adapt.setWidth(15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: Adapt.setWidth(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: CachedNetworkImage(
                                          height: Adapt.setHeight(220),
                                          width: Adapt.setWidth(160),
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
                                        child: Text(
                                          "Moonlight",
                                          style: TextStyle(
                                            fontSize: Adapt.sp(15),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [1, 2, 4, 3, 5].map((e) {
                                              return const Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: Adapt.setWidth(10),
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
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Adapt.setWidth(15),
                            right: Adapt.setWidth(15),
                            top: Adapt.setHeight(20),
                            bottom: Adapt.setHeight(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Movies on theater",
                                style: TextStyle(
                                  fontSize: Adapt.sp(17),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("SEE ALL"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Adapt.setWidth(15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: Adapt.setWidth(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: CachedNetworkImage(
                                          height: Adapt.setHeight(220),
                                          width: Adapt.setWidth(160),
                                          imageUrl:
                                              "https://picsum.photos/id/${e * 63}/300/300",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: Adapt.setHeight(7),
                                          bottom: Adapt.setHeight(3),
                                        ),
                                        child: Text(
                                          "Moonlight",
                                          style: TextStyle(
                                            fontSize: Adapt.sp(15),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [1, 2, 4, 3, 5].map((e) {
                                              return const Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: Adapt.setWidth(10),
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
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Adapt.setWidth(15),
                            right: Adapt.setWidth(15),
                            top: Adapt.setHeight(20),
                            bottom: Adapt.setHeight(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Movies on theater",
                                style: TextStyle(
                                  fontSize: Adapt.sp(17),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("SEE ALL"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Adapt.setWidth(15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: Adapt.setWidth(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: CachedNetworkImage(
                                          height: Adapt.setHeight(220),
                                          width: Adapt.setWidth(160),
                                          imageUrl:
                                              "https://picsum.photos/id/${e * 76}/300/300",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: Adapt.setHeight(7),
                                          bottom: Adapt.setHeight(3),
                                        ),
                                        child: Text(
                                          "Moonlight",
                                          style: TextStyle(
                                            fontSize: Adapt.sp(15),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [1, 2, 4, 3, 5].map((e) {
                                              return const Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: Adapt.setWidth(10),
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
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Adapt.setHeight(20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Adapt.setHeight(400),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://picsum.photos/600",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(100),
                    ),
                    child: Column(
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
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              height: 0.95,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Adapt.setWidth(15),
                            vertical: Adapt.setHeight(15),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [1, 2, 4, 3, 5].map((e) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: Adapt.setWidth(10),
                              ),
                              Text(
                                "189 Reviews",
                                style: TextStyle(
                                  fontSize: Adapt.sp(17),
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
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
                        SizedBox(
                          height: Adapt.setHeight(12),
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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Adapt.setWidth(15),
                right: Adapt.setWidth(15),
                top: Adapt.setHeight(10),
                bottom: Adapt.setHeight(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies on theater",
                    style: TextStyle(
                      fontSize: Adapt.sp(17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ListMoviesScreen.routeName,
                      );
                    },
                    child: const Text("SEE ALL"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.setWidth(15),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: Adapt.setWidth(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: CachedNetworkImage(
                              height: Adapt.setHeight(250),
                              width: Adapt.setWidth(210),
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
                            child: Text(
                              "Moonlight",
                              style: TextStyle(
                                fontSize: Adapt.sp(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [1, 2, 4, 3, 5].map((e) {
                                  return const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.red,
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: Adapt.setWidth(10),
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
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Adapt.setWidth(15),
                right: Adapt.setWidth(15),
                top: Adapt.setHeight(20),
                bottom: Adapt.setHeight(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies on theater",
                    style: TextStyle(
                      fontSize: Adapt.sp(17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("SEE ALL"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.setWidth(15),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: Adapt.setWidth(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: CachedNetworkImage(
                              height: Adapt.setHeight(250),
                              width: Adapt.setWidth(210),
                              imageUrl:
                                  "https://picsum.photos/id/${e * 63}/300/300",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Adapt.setHeight(7),
                              bottom: Adapt.setHeight(3),
                            ),
                            child: Text(
                              "Moonlight",
                              style: TextStyle(
                                fontSize: Adapt.sp(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [1, 2, 4, 3, 5].map((e) {
                                  return const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.red,
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: Adapt.setWidth(10),
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
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Adapt.setWidth(15),
                right: Adapt.setWidth(15),
                top: Adapt.setHeight(20),
                bottom: Adapt.setHeight(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies on theater",
                    style: TextStyle(
                      fontSize: Adapt.sp(17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("SEE ALL"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.setWidth(15),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: Adapt.setWidth(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: CachedNetworkImage(
                              height: Adapt.setHeight(250),
                              width: Adapt.setWidth(210),
                              imageUrl:
                                  "https://picsum.photos/id/${e * 76}/300/300",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Adapt.setHeight(7),
                              bottom: Adapt.setHeight(3),
                            ),
                            child: Text(
                              "Moonlight",
                              style: TextStyle(
                                fontSize: Adapt.sp(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [1, 2, 4, 3, 5].map((e) {
                                  return const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.red,
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: Adapt.setWidth(10),
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
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
*/