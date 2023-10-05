import 'package:flutter/material.dart';

import '../../domain/domain.dart';
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
            title: FittedBox(
              child: Text(
                episode.name,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: EpisodeCharacterList(episode: episode),
            ),
          )
        ],
      ),
    );
  }
}
