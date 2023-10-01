
import 'package:flutter/material.dart';
import 'package:interstellar_insight/features/episodes/presentation/widgets/episode_card.dart';

import '../../domain/entities/episode.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: episodes.length,
      padding: const EdgeInsets.all(20).copyWith(bottom: 40),
      separatorBuilder: (context, i) => const SizedBox(height: 20),
      itemBuilder: (context, index) => EpisodeCard(episode: episodes[index]),
    );
  }
}