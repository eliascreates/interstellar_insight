import 'package:flutter/material.dart';
import 'package:interstellar_insight/models/character.dart';

import 'simple_character_tile.dart';

class SimpleCharacterTileList extends StatelessWidget {
  const SimpleCharacterTileList({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return SimpleCharacterTile(character: character);
        },
      ),
    );
  }
}
