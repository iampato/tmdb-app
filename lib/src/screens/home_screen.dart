import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tmdb_app/src/styles/adapt.dart';
import 'package:tmdb_app/src/widget/home/home_backdrop.dart';
import 'package:tmdb_app/src/widget/home/now_playing.dart';
import 'package:tmdb_app/src/widget/home/popular_movies.dart';
import 'package:tmdb_app/src/widget/home/top_rated_movies.dart';

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
    // debugPrint("UPDATE SCROLL");
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
        Future.delayed(const Duration(milliseconds: 10), () {}).then((s) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
      }
    } else {
      if (metrics.pixels > 80 && metrics.pixels <= 300) {
        Future.delayed(const Duration(milliseconds: 10), () {}).then((s) {
          _scrollController.animateTo(
            280,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            HomeBackdrop(
              height: 400,
              scrollController: _scrollController,
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
                padding: EdgeInsets.only(
                  bottom: Adapt.setHeight(25),
                ),
                child: Column(
                  children: [
                    SizedBox(height: Adapt.setHeight(383)),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Adapt.setWidth(20)),
                          topRight: Radius.circular(Adapt.setWidth(20)),
                        ),
                      ),
                      child: Column(
                        children: const [
                          NowPlaying(),
                          TopRatedMovies(),
                          PopularMovies(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
