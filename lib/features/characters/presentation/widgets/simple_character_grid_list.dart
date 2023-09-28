import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:interstellar_insight/models/character.dart';
import 'package:interstellar_insight/features/characters/presentation/widgets/simple_character_card.dart';

import '../bloc/characters_bloc.dart';

class SimpleCharacterGridList extends StatelessWidget {
  const SimpleCharacterGridList({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final characters =
        context.select((CharactersBloc bloc) => bloc.state.characters);

    if (characters.isEmpty) {
      return const Center(child: Text('No Characters'));
    }

    return RepaintBoundary(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: MasonryGridView.builder(
          controller: scrollController,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemCount: characters.length,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (context, index) {
            final character = characters[index];
            return SimpleCharacterCard(
              character: character,
              height: (Random().nextDouble() + 2) * 80,
            );
          },
        ),
      ),
    );
  }
}
