import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/shared/widgets/shared_widgets.dart';

import '../../domain/domain.dart';

class CharactersDetailPage extends StatelessWidget {
  const CharactersDetailPage(
      {super.key, required this.character, this.widgetName = ''});

  final Character character;
  final String widgetName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CharactersPageView(character: character, widgetName: widgetName),
    );
  }
}

class CharactersPageView extends StatelessWidget {
  const CharactersPageView({
    super.key,
    required this.character,
    this.widgetName = '',
  });
  final Character character;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: '${character.imageUrl}-$widgetName',
          child: CachedNetworkImage(
            imageUrl: character.imageUrl,
            placeholder: (context, url) => const CharacterImagePlaceholder(
              height: 300,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              height: 350,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
        ),
      ],
    );
  }
}
