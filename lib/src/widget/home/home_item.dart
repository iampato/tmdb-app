import 'package:flutter/material.dart';

import 'package:tmdb_app/src/styles/adapt.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Adapt.setWidth(15),
            right: Adapt.setWidth(15),
            top: Adapt.setHeight(20),
            bottom: Adapt.setHeight(2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Adapt.sp(17),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text("SEE ALL"),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adapt.setWidth(15),
          ),
          child: child,
        ),
      ],
    );
  }
}
