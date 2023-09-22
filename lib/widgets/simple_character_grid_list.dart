import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:interstellar_insight/models/character.dart';
import 'package:interstellar_insight/widgets/simple_character_card.dart';

class SimpleCharacterGridList extends StatelessWidget {
  const SimpleCharacterGridList({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: MasonryGridView.builder(
        controller: scrollController,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        itemCount: characters.length,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        itemBuilder: (context, index) {
          final character = characters[index];
          return SimpleCharacterCard(
            character: character,
            height: (Random().nextDouble() + 2) * (100 + index),
          );
        },
      ),
    );
  }
}
