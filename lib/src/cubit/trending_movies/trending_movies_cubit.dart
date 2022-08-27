import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'trending_movies_state.dart';
part 'trending_movies_cubit.freezed.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  final MovieRepository movieRepository;
  TrendingMoviesCubit({
    required this.movieRepository,
  }) : super(const TrendingMoviesState.initial());
}
