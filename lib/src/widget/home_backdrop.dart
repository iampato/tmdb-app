import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_app/src/styles/adapt.dart';

class HomeBackdrop extends StatefulWidget {
  final double height;
  const HomeBackdrop({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<HomeBackdrop> createState() => _HomeBackdropState();
}

class _HomeBackdropState extends State<HomeBackdrop> {
  double get _height => widget.height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adapt.setHeight(_height),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://picsum.photos/600",
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
                      fontSize: Adapt.sp(28),
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      height: 0.95,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(15),
                    vertical: Adapt.setHeight(10),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [1, 2, 4, 3, 5].map((e) {
                          return const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.red,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        width: Adapt.setWidth(10),
                      ),
                      Text(
                        "189 Reviews",
                        style: TextStyle(
                          fontSize: Adapt.sp(14.5),
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(15),
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Adapt.setHeight(30),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Adapt.padTopH() * 0.9,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text("TMDB APP"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
