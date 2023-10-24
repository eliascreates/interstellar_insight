import 'package:flutter/material.dart';

import 'package:interstellar_insight/core/shared/shared.dart';

import '../../domain/domain.dart';

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
          if (location.inhabitants.isNotEmpty)
            Text(
              'Inhabitants',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 10.0,
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: List.generate(
              location.inhabitants.length,
              (index) => DetailTag(tagName: location.inhabitants[index]),
            ),
          ),
          const SizedBox(height: 20),
          location.notableResidents.isEmpty
              ? const Text("No one lives here")
              : RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: location.notableResidents.length == 1
                            ? "There is only "
                            : "There are ",
                      ),
                      TextSpan(
                        text: location.notableResidents.length.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: location.notableResidents.length == 1
                            ? "  well known resident."
                            : "  well known residents.",
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
