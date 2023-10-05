import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:interstellar_insight/config/routes/custom_page_route.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';
import 'package:interstellar_insight/core/shared/widgets/shared_widgets.dart';

import '../../domain/domain.dart';
import '../pages/characters_detail_page.dart';

class SimpleCharacterCard extends StatelessWidget {
  const SimpleCharacterCard({
    super.key,
    required this.character,
    required this.height,
  });

  final Character character;
  final double height;

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        FadePageRoute(
          page: CharactersDetailPage(
            character: character,
            widgetName: 'SimpleCharacterCard',
          ),
        ),
      ),
      child: Stack(
        children: [
          Hero(
            tag: '${character.imageUrl}-SimpleCharacterCard',
            child: CachedNetworkImage(
              imageUrl: character.imageUrl,
              placeholder: (context, url) => CharacterImagePlaceholder(
                height: height,
                color: character.cleanStatus.color.withOpacity(0.2),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                height: height,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [shadowColor.withOpacity(0.2), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.2),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0, 1),
                    )
                  ],
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: character.cleanStatus.color,
                ),
                const SizedBox(width: 10),
                Text(
                  character.firstName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
