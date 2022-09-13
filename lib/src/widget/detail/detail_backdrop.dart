
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_app/src/styles/adapt.dart';

class DetailBackDrop extends StatelessWidget {
  final String imageUrl;
  final String title;
  const DetailBackDrop({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          color: Colors.black.withAlpha(100),
          colorBlendMode: BlendMode.darken,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                  Adapt.setWidth(10),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Adapt.setHeight(120),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.85],
                colors: [
                  theme.scaffoldBackgroundColor.withOpacity(0.0),
                  theme.scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.setWidth(15),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: Adapt.sp(32),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
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
                        color: Colors.black54,
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
                        color: Colors.black54,
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
                        color: Colors.black54,
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
                        color: Colors.black54,
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
                        color: Colors.black54,
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
                        color: Colors.black54,
                        fontSize: Adapt.sp(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
