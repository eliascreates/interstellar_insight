import 'package:flutter/material.dart';
import 'package:interstellar_insight/features/episodes/domain/entities/episode.dart';

import '../widgets/widgets.dart';

class EpisodeDetailPage extends StatelessWidget {
  const EpisodeDetailPage({super.key, required this.episode});
  final Episode episode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            iconTheme: const IconThemeData(size: 30),
            title: Text(
              episode.name,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              EpisodeDetailImage(imageUrl: episode.imageUrl),
              EpisodeDetailBody(episode: episode),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Featured Characters',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: EpisodeCharacterList(),
            ),
          )
        ],
      ),
    );
  }
}
