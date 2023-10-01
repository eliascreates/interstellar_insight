import 'package:flutter/material.dart';
import 'package:interstellar_insight/features/episodes/domain/entities/episode.dart';

import '../widgets/episode_character_card.dart';
import '../widgets/episode_character_list.dart';
import '../widgets/episode_detail_image.dart';

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
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              EpisodeDetailImage(imageUrl: episode.imageUrl),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Director: ",
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(episode.director),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Writer: ",
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(episode.writer),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Release Date: ",
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(episode.releaseDate),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(thickness: 2),
                    Text(
                      "There are a total of ${episode.characters.length} charactes who gained the most screentime in this episode.",
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Featured Characters',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
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
