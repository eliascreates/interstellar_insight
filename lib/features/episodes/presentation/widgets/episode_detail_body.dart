import 'package:flutter/material.dart';

import '../../domain/domain.dart';

part 'episode_detail_tag.dart';

class EpisodeDetailBody extends StatelessWidget {
  const EpisodeDetailBody({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              EpisodeDetailTag(tagName: "Director", tagValue: episode.director),
              EpisodeDetailTag(tagName: "Writer", tagValue: episode.writer),
              EpisodeDetailTag(
                tagName: "Release Date",
                tagValue: episode.releaseDate,
              ),
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                const TextSpan(text: "In this episode  "),
                TextSpan(
                  text: episode.characters.length.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const TextSpan(
                  text: "  characters received the most screen time.",
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
        ],
      ),
    );
  }
}
