import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/src/entities/dto/genres_dto.dart';
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
        "/movie/$movieId/credits?api_key=${AppConfig.getConfig().apiKey}&language=en-US";
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

  // get movie genres
  Future<GenresDto?> getMovieGenres() async {
    String endpoint =
        "/genre/movie/list?api_key=${AppConfig.getConfig().apiKey}&language=en-US";
    try {
      Response response = await _httpNetworkUtil.getRequest(
        endpoint,
      );
      if (response.statusCode == 200) {
        Logger().d(response.data);
        final genres = GenresDto.fromJson(response.data);
        Logger().d(genres);
        return genres;
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
        "/movie/now_playing?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
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
        "/movie/popular?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
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
        "/movie/top_rated?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
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
        "/movie/$movieId?api_key=${AppConfig.getConfig().apiKey}&language=en-US";
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
        "/movie/trending/movie?api_key=${AppConfig.getConfig().apiKey}&page=$page";
    // "/trending/all/week?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
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
        "/movie/upcoming?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";
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
  Future<MovieDto?> similiarMovies({required int movieId, int page = 1}) async {
    String endpoint =
        "/movie/$movieId/similar?api_key=${AppConfig.getConfig().apiKey}&language=en-US&page=$page";

    Logger().i(endpoint);
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
        "/movie/search/movie?api_key=${AppConfig.getConfig().apiKey}&language=en-US&query=$query&page=$page";
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
