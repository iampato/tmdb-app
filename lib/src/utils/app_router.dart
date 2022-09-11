import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/screens/detail_movie_screen.dart';
import 'package:tmdb_app/src/screens/main_screen.dart';
import 'package:tmdb_app/src/screens/now_playing_list.dart';
import 'package:tmdb_app/src/screens/popular_movies_list.dart';
import 'package:tmdb_app/src/screens/toprated_movies_list.dart';
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
      name: NowPlayingList.routeName,
      path: '/${NowPlayingList.routeName}',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const NowPlayingList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            PageTransitions.slideUp(
                context, animation, secondaryAnimation, child),
      ),
    ),
    GoRoute(
      name: PopularMoviesList.routeName,
      path: '/${PopularMoviesList.routeName}',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const PopularMoviesList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            PageTransitions.slideUp(
                context, animation, secondaryAnimation, child),
      ),
    ),
    GoRoute(
      name: TopRatedMoviesList.routeName,
      path: '/${TopRatedMoviesList.routeName}',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const TopRatedMoviesList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            PageTransitions.slideUp(
          context,
          animation,
          secondaryAnimation,
          child,
        ),
      ),
    ),
    GoRoute(
      name: DetailMovieScreen.routeName,
      path: '/${DetailMovieScreen.routeName}/:movieId',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: DetailMovieScreen(
          movie: (state.extra as Results),
        ),
      ),
    ),
  ],
  initialLocation: "/",
  debugLogDiagnostics: true,
  errorBuilder: (error, stackTrace) => Scaffold(
    body: Center(
      child: Text(
        '$error',
        textAlign: TextAlign.center,
      ),
    ),
  ),
);
