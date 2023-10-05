import 'package:flutter/material.dart';

import '../../domain/domain.dart';

part 'location_detail_tag.dart';

class LocationDetailBody extends StatelessWidget {
  const LocationDetailBody({super.key, required this.location});

  final Location location;

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
              LocationDetailTag(tagName: "Director", tagValue: location.name),
              LocationDetailTag(tagName: "Writer", tagValue: location.type),
              LocationDetailTag(
                tagName: "Release Date",
                tagValue: location.type,
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
                  text: location.inhabitants.length.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
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
