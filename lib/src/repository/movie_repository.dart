import 'package:dio/dio.dart';
import 'package:tmdb_app/src/entities/dto/movie_credit_dto.dart';
import 'package:tmdb_app/src/entities/dto/movie_dto.dart';
import 'package:tmdb_app/src/entities/dto/single_movie_dto.dart';
import 'package:tmdb_app/src/utils/app_config.dart';
import 'package:tmdb_app/src/utils/http_client.dart';

class MovieRepository {
  // global variables
  final HttpNetworkUtil _httpNetworkUtil = HttpNetworkUtil();

  // movie credits
  Future<MovieCreditsDto?> getMovieCredits({required int movieId}) async {
    String endpoint =
        "/$movieId/credits?api_key=${AppConfig.getConfig().apiKey}&language=en-US";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movie = MovieCreditsDto.fromJson(response.data);
        return movie;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // now playing
  Future<MovieDto?> nowPlaying({int page = 1}) async {
    String endpoint =
        "/now_playing?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // popular
  Future<MovieDto?> popularMovies({int page = 1}) async {
    String endpoint =
        "/popular?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // top rated
  Future<MovieDto?> topRateMovies({int page = 1}) async {
    String endpoint =
        "/top_rated?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // single movie
  Future<SingleMovieDto?> getMovieDetail({required int movieId}) async {
    String endpoint =
        "/$movieId?api_key=${AppConfig.getConfig().apiKey}&language=en-US";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movie = SingleMovieDto.fromJson(response.data);
        return movie;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // trending
  Future<MovieDto?> trendingMovies({int page = 1}) async {
    String endpoint =
        "/trending/all/week?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // upcoming
  Future<MovieDto?> upcomingMovies({int page = 1}) async {
    String endpoint =
        "/upcoming?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // similiar
  Future<MovieDto?> similiarMovies({
    required int page,
    required int movieId,
  }) async {
    String endpoint =
        "/$movieId/similiar?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // search
  Future<MovieDto?> searchMovies({
    required int page,
    required String query,
  }) async {
    String endpoint =
        "/search/movie?api_key=${AppConfig.getConfig().apiKey}&language=en-US&query=$query&page=$page";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        final movies = MovieDto.fromJson(response.data);
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
