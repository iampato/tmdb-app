import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieListBody extends StatefulWidget {
  final String title;
  final Function onFetchMore;
  final Widget body;
  const MovieListBody(
      {super.key,
      required this.title,
      required this.onFetchMore,
      required this.body});

  @override
  State<MovieListBody> createState() => _MovieListBodyState();
}

class _MovieListBodyState extends State<MovieListBody> {
  String get title => widget.title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            widget.onFetchMore();
          }
          return true;
        },
        child: widget.body,
      ),
    );
  }
}
