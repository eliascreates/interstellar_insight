import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'character_image_placeholder.dart';

class CharacterDetailPhoto extends StatelessWidget {
  const CharacterDetailPhoto({
    super.key,
    required this.character,
    required this.widgetName,
  });

  final Character character;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;

    return Hero(
      tag: '${character.imageUrl}-$widgetName',
      child: CachedNetworkImage(
        imageUrl: character.imageUrl,
        placeholder: (context, url) => const CharacterImagePlaceholder(
          height: 300,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          height: 330,
          margin: const EdgeInsets.symmetric(horizontal: 20),
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
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.darken,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
