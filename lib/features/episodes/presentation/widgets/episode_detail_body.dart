import 'package:flutter/material.dart';

import '../../domain/entities/episode.dart';

class EpisodeDetailBody extends StatelessWidget {
  const EpisodeDetailBody({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                const TextSpan(text: "There are a total of  "),
                TextSpan(
                  text: episode.characters.length.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const TextSpan(
                    text:
                        "  charactes who gained the most screentime in this episode."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
