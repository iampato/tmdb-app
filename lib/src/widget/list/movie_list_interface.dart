import 'package:flutter/material.dart';

abstract class MovieListDelegate {
  void setTitle(String title);
  void onTapMovie(String movieId);
  Widget onLoading();
  Widget onError(String message);
  Widget onSuccess(dynamic data);
  void onPagination();
}
