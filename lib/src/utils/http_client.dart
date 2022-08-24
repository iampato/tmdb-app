import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/src/utils/app_config.dart';

class HttpNetworkUtil {
  // Setup a singleton
  static final HttpNetworkUtil _httpClient = HttpNetworkUtil._internal();
  factory HttpNetworkUtil() {
    return _httpClient;
  }
  HttpNetworkUtil._internal();

  // global variables
  final Logger _logger = Logger();

  BaseOptions baseOptions = BaseOptions(
    baseUrl: AppConfig.getConfig().apiUrl,
    contentType: 'application/json',
    connectTimeout: 20 * 1000,
    receiveTimeout: 20 * 1000,
    followRedirects: true,
  );

  Dio get dio => Dio(baseOptions);

  // methods
  Future<Response> getRequest(String endpoint) async {
    try {
      Response response = await addInterceptors().get(
        endpoint,
      );
      _logger.i(
          "getRequest:\nurl:${response.realUri.toString()}\nresponse:${response.statusCode}");
      return response;
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }

  Future<Response> postRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      Response response = await addInterceptors().post(
        endpoint,
        data: json.encode(body),
      );
      _logger.i(
        "postRequest:\nurl:${response.realUri.toString()}\nresponse:\n${response.statusCode}\n${response.data}",
      );
      return response;
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }

  Future<Response> putRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    _logger.d(json.encode(body));
    try {
      Response response = await addInterceptors().put(
        endpoint,
        data: json.encode(body),
      );
      _logger.i(
        "putRequest:\nurl:${response.realUri.toString()}\nresponse:\n${response.statusCode}\n${response.data}",
      );
      return response;
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    try {
      Response response = await addInterceptors().delete(
        endpoint,
      );
      _logger.i(
        "deleteRequest:\nurl:${response.realUri.toString()}\nresponse:\n${response.statusCode}",
      );
      return response;
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }

  Dio addInterceptors() {
    return dio;
  }
}