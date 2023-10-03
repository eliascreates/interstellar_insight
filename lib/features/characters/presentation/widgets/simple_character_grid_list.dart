import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:interstellar_insight/core/extension/extension.dart';
import 'package:interstellar_insight/features/characters/presentation/widgets/simple_character_card.dart';

import '../bloc/characters_bloc.dart';

class SimpleCharacterGridList extends StatelessWidget {
  const SimpleCharacterGridList({super.key});

  @override
  Widget build(BuildContext context) {
    final characters =
        context.select((CharactersBloc bloc) => bloc.state.characters);

    return MasonryGridView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        final cardSize = determineCardSize(character.name);
        return SimpleCharacterCard(
          character: character,
          height: cardSize.size,
        );
      },
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(10.0),
    );
  }
}

CardSize determineCardSize(String name) {
  if (name.length < 5 && name != 'Viro') {
    return CardSize.large;
  } else if (name.length < 10 && name != 'Werthrent') {
    return CardSize.small;
  } else {
    return CardSize.medium;
  }
}
