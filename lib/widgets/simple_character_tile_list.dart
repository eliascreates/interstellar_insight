import 'package:flutter/material.dart';
import 'package:interstellar_insight/models/character.dart';

import 'simple_character_tile.dart';

class SimpleCharacterTileList extends StatelessWidget {
  const SimpleCharacterTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return SimpleCharacterTile(character: character);
      },
    );
  }
}
