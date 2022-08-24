import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

setupRepository() {
  return [
    RepositoryProvider(
      create: (context) => MovieRepository(),
    ),
  ];
}
