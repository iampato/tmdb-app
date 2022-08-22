import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/src/screens/detail_movie_screen.dart';
import 'package:tmdb_app/src/screens/list_movies_screen.dart';
import 'package:tmdb_app/src/screens/main_screen.dart';
import 'package:tmdb_app/src/utils/page_route_transition.dart';

enum RouteAnimation {
  none,
  slide,
  slideUp,
  sharedAxis,
  fadeScale,
  fadeThrough,
  fade,
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments;

    switch (settings.name) {
      case MainScreen.routeName:
        return _route(
          const MainScreen(),
          RouteAnimation.fade,
        );
      case ListMoviesScreen.routeName:
        return _route(
          const ListMoviesScreen(),
          RouteAnimation.slideUp,
        );
      case DetailMovieScreen.routeName:
        return _route(
          const DetailMovieScreen(),
          RouteAnimation.none,
        );

      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('Talksay'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text('Unknown page'),
            ),
          ),
          RouteAnimation.none,
        );
    }
  }

  static _route(Widget page, RouteAnimation animation) {
    if (animation == RouteAnimation.none) {
      return CupertinoPageRoute(
        builder: (context) {
          return page;
        },
      );
    } else if (animation == RouteAnimation.fade) {
      return PageRoutes.fade(
        () => page,
      );
    } else if (animation == RouteAnimation.slideUp) {
      return PageRoutes.slideUp(
        () => page,
        duration: 0.5,
        easeFwd: Curves.decelerate,
      );
    } else if (animation == RouteAnimation.sharedAxis) {
      return PageRoutes.sharedAxis(
        () => page,
      );
    } else if (animation == RouteAnimation.fadeScale) {
      return PageRoutes.fadeScale(
        () => page,
      );
    } else if (animation == RouteAnimation.slide) {
      return PageRoutes.slide(
        () => page,
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return page;
        },
      );
    }
  }
}
