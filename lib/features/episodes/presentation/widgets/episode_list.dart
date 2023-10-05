import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/episodes_bloc.dart';
import 'episode_card.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({super.key});

  @override
  Widget build(BuildContext context) {
    final episodes = context.select((EpisodesBloc bloc) => bloc.state.episodes);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: episodes.length,
      padding: const EdgeInsets.all(20).copyWith(bottom: 40),
      separatorBuilder: (context, i) => const SizedBox(height: 20),
      itemBuilder: (context, index) => EpisodeCard(episode: episodes[index]),
    );
  }
}
