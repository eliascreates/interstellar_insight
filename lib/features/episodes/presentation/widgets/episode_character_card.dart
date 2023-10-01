import 'package:flutter/material.dart';

import '../../domain/entities/episode.dart';

class EpisodeCharacterCard extends StatelessWidget {
  final Episode episode;

  const EpisodeCharacterCard(this.episode, {super.key});

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;

    return Container(
      width: 130,
      height: 150,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(1, 5),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(episode.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [shadowColor.withOpacity(0.3), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        child: const Text(
          "The Queen of Ventrexia",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
