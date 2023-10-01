
import 'package:flutter/material.dart';

import '../../domain/entities/episode.dart';
import 'episode_character_card.dart';

class EpisodeCharacterList extends StatelessWidget {
  const EpisodeCharacterList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => EpisodeCharacterCard(episodes[index]),
      separatorBuilder: (context, i) => const SizedBox(width: 20),
      itemCount: episodes.length,
    );
  }
}
