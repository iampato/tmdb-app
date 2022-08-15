// import 'package:dio/dio.dart';
// import 'package:notflix/app/data/dto/movie_credit_dto.dart';
// import 'package:notflix/app/data/dto/movie_detail_dto.dart';
// import 'package:notflix/app/data/dto/now_playing_dto.dart';
// import 'package:notflix/app/data/dto/popular_movies_dto.dart';
// import 'package:notflix/app/data/dto/similiar_movies_dto.dart';
// import 'package:notflix/app/domain/repository/movie_repository.dart';
// import 'package:notflix/app/utils/configs.dart';
// import 'package:notflix/app/utils/http_client.dart';

// class MovieRepositoryImpl extends MovieRepository {
//   // global variables
//   final HttpNetworkUtil _httpNetworkUtil = HttpNetworkUtil();

//   @override
//   Future<NowPlayingDto?> nowPlaying() async {
//     const endpoint = "/now_playing?api_key=$API_KEY&language=en-US&page=1";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movies = NowPlayingDto.fromJson(response.data);
//         return movies;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<PopularMoviesDto?> popularMovies({int page = 1}) async {
//     String endpoint = "/popular?api_key=$API_KEY&language=en-US&page=$page";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movies = PopularMoviesDto.fromJson(response.data);
//         return movies;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<PopularMoviesDto?> topRateMovies({int page = 1}) async {
//     String endpoint = "/top_rated?api_key=$API_KEY&language=en-US&page=$page";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movies = PopularMoviesDto.fromJson(response.data);
//         return movies;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<PopularMoviesDto?> upcomingMovies({int page = 1}) async {
//     String endpoint = "/upcoming?api_key=$API_KEY&language=en-US&page=$page";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movies = PopularMoviesDto.fromJson(response.data);
//         return movies;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<SimiliarMoviesDto?> similiarMovies({
//     required int page,
//     required int movieId,
//   }) async {
//     String endpoint =
//         "/$movieId/similiar?api_key=$API_KEY&language=en-US&page=$page";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movies = SimiliarMoviesDto.fromJson(response.data);
//         return movies;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<MovieDetailDto?> getMovieDetail({required int movieId}) async {
//     String endpoint = "/$movieId?api_key=$API_KEY&language=en-US";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movie = MovieDetailDto.fromJson(response.data);
//         return movie;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<MovieCreditsDto?> getMovieCredits({required int movieId}) async {
//     String endpoint = "/$movieId/credits?api_key=$API_KEY&language=en-US";
//     try {
//       Response response = await _httpNetworkUtil.getRequest(
//         endpoint,
//       );
//       if (response.statusCode == 200) {
//         final movie = MovieCreditsDto.fromJson(response.data);
//         return movie;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
