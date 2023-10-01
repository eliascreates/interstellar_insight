import 'package:flutter/material.dart';

class EpisodeDetailImage extends StatelessWidget {
  final String imageUrl;

  const EpisodeDetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;
    return Hero(
      tag: imageUrl,
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(1, 5),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}