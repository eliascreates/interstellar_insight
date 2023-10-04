import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../characters/characters.dart';
import '../../domain/domain.dart';

import 'episode_character_card.dart';

class EpisodeCharacterList extends StatelessWidget {
  const EpisodeCharacterList({super.key, required this.episode});
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    final featuredIds = episode.characters.map((character) {
      final strId = character.split('/').last.trim();

      return int.tryParse(strId) ?? -1;
    });

    final characters = context.select(
      (CharactersBloc bloc) => bloc.state.characters,
    );
    final featuredCharacters = featuredIds
        .map(
          (id) => characters.firstWhere((character) => character.id == id),
        )
        .toList();

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => EpisodeCharacterCard(featuredCharacters[index]),
      separatorBuilder: (context, i) => const SizedBox(width: 20),
      itemCount: featuredCharacters.length,
    );
  }
}
