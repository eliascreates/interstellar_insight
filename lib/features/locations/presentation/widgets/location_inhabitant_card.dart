import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:interstellar_insight/features/characters/characters.dart' show Character;

class LocationInhabitantCard extends StatelessWidget {
  final Character character;

  const LocationInhabitantCard(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;

    return CachedNetworkImage(
      imageUrl: character.imageUrl,
      imageBuilder: (context, imageProvider) {
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
              image: imageProvider,
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
            child: Text(
              character.firstName, 
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        );
      }
    );
  }
}
