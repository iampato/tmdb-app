import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_app/src/styles/adapt.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final int voteAverage;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: Adapt.setWidth(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              height: Adapt.screenH() * 0.27,
              width: Adapt.screenW() * 0.39,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
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
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Adapt.setHeight(7),
              bottom: Adapt.setHeight(3),
            ),
            child: LimitedBox(
              maxWidth: Adapt.screenW() * 0.36,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Adapt.sp(15),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Row(
                children: [1, 2, 4, 3, 5].map((e) {
                  return const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.red,
                  );
                }).toList(),
              ),
              SizedBox(
                width: Adapt.setWidth(10),
              ),
              Text(
                "$voteCount Votes",
                style: TextStyle(
                  fontSize: Adapt.sp(11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
