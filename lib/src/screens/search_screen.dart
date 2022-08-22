import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_app/src/screens/detail_movie_screen.dart';
import 'package:tmdb_app/src/styles/adapt.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Adapt.setWidth(20),
                    vertical: 0,
                  ),
                  hintText: 'Search here',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: Adapt.setWidth(10),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.09),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.setWidth(12),
                vertical: Adapt.setHeight(10),
              ),
              child: Icon(
                Icons.tune,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Adapt.setWidth(15),
              right: Adapt.setWidth(15),
              top: Adapt.setHeight(15),
              bottom: Adapt.setHeight(5),
            ),
            child: Text(
              "Top searches",
              style: TextStyle(
                fontSize: Adapt.sp(17),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.setWidth(15),
                vertical: Adapt.setHeight(15),
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: Adapt.setHeight(17),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailMovieScreen.routeName,
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: CachedNetworkImage(
                            height: Adapt.setHeight(100),
                            width: Adapt.setWidth(165),
                            imageUrl:
                                "https://picsum.photos/id/${index * 24}/300/300",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: Adapt.setWidth(15),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Adapt.setHeight(15),
                            ),
                            Text(
                              "Moonlight",
                              style: TextStyle(
                                fontSize: Adapt.sp(15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
