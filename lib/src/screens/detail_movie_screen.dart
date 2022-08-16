import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/src/utils/adapt.dart';

class DetailMovieScreen extends StatelessWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

  static const routeName = "/detail-movies";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Adapt.setHeight(400),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://picsum.photos/id/34/600",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(100),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Adapt.setWidth(15),
                          ),
                          child: Text(
                            "Murder on the orient express",
                            style: TextStyle(
                              fontSize: Adapt.sp(32),
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              height: 0.95,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Adapt.setWidth(15),
                            vertical: Adapt.setHeight(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white54,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Adapt.setWidth(10),
                                  vertical: Adapt.setWidth(5),
                                ),
                                child: Text(
                                  "THRILLER",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: Adapt.sp(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Adapt.setWidth(10),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white54,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Adapt.setWidth(10),
                                  vertical: Adapt.setWidth(5),
                                ),
                                child: Text(
                                  "ACTION",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: Adapt.sp(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Adapt.setWidth(10),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white54,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Adapt.setWidth(10),
                                  vertical: Adapt.setWidth(5),
                                ),
                                child: Text(
                                  "HISTORY",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: Adapt.sp(10),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
