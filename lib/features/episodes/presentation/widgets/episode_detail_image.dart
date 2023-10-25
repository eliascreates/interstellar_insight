import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EpisodeDetailImage extends StatelessWidget {
  final String imageUrl;

  const EpisodeDetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;
    return Hero(
      tag: imageUrl,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.3), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        imageBuilder: (context, imageProvider) {
          return Container(
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
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
