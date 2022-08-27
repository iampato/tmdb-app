import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_app/src/entities/models/movie_model.dart';
import 'package:tmdb_app/src/repository/movie_repository.dart';

part 'similar_movies_state.dart';
part 'similar_movies_cubit.freezed.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  final MovieRepository movieRepository;
  SimilarMoviesCubit({
    required this.movieRepository,
  }) : super(const SimilarMoviesState.initial());
}
