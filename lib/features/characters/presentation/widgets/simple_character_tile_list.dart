import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/characters_bloc.dart';
import 'simple_character_tile.dart';

class SimpleCharacterTileList extends StatelessWidget {
  const SimpleCharacterTileList({super.key});

  @override
  Widget build(BuildContext context) {
    final characters =
        context.select((CharactersBloc bloc) => bloc.state.characters);

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return SimpleCharacterTile(character: character);
      },
    );
  }
}
