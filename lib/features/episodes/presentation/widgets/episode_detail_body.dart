import 'package:flutter/material.dart';

import '../../domain/entities/episode.dart';

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

class EpisodeDetailTag extends StatelessWidget {
  const EpisodeDetailTag({
    super.key,
    required this.tagName,
    required this.tagValue,
  });

  final String tagName;
  final String tagValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.amberAccent.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.2),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$tagName: ",
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(tagValue),
        ],
      ),
    );
  }
}
