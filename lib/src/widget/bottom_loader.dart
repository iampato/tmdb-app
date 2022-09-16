import 'package:flutter/material.dart';
import 'package:tmdb_app/src/styles/adapt.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Adapt.setHeight(50),
        width: Adapt.setHeight(50),
        child: const CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
