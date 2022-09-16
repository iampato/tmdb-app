import '../entities/models/genre_model.dart';

String? swapGenres({
  required int genreId,
  GenresModel? genres,
}) {
  if (genres != null) {
    final genre = genres.genres.firstWhere((element) => element.id == genreId);
    return genre.name;
  }
  return null;
}
