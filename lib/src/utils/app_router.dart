import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_app/src/screens/detail_movie_screen.dart';
import 'package:tmdb_app/src/screens/list_movies_screen.dart';
import 'package:tmdb_app/src/screens/main_screen.dart';
import 'package:tmdb_app/src/utils/page_route_transition.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: MainScreen.routeName,
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const MainScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            PageTransitions.fade(context, animation, secondaryAnimation, child),
      ),
    ),
    GoRoute(
      name: ListMoviesScreen.routeName,
      path: '/${ListMoviesScreen.routeName}',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const ListMoviesScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            PageTransitions.slideUp(
                context, animation, secondaryAnimation, child),
      ),
    ),
    GoRoute(
      name: DetailMovieScreen.routeName,
      path: '/${DetailMovieScreen.routeName}',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const DetailMovieScreen(),
      ),
    ),
  ],
  initialLocation: "/",
  errorBuilder: (error, stackTrace) => Scaffold(
    body: Center(
      child: Text(
        '$error',
        textAlign: TextAlign.center,
      ),
    ),
  ),
);
