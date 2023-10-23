import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';

import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class CharactersDetailPage extends StatelessWidget {
  const CharactersDetailPage({
    super.key,
    required this.character,
    this.widgetName = '',
  });

  final Character character;
  final String widgetName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CharactersPageView(character: character, widgetName: widgetName),
    );
  }
}

class CharactersPageView extends StatelessWidget {
  const CharactersPageView({
    super.key,
    required this.character,
    this.widgetName = '',
  });
  final Character character;
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.medium(
          iconTheme: const IconThemeData(size: 30),
          title: FittedBox(
            child: Text(
              character.name,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              CharacterDetailPhoto(
                character: character,
                widgetName: widgetName,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 14.0, // Adjust the font size as needed
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Status: ${character.status}, Hair Color: ${character.origin}',
                            style: TextStyle(
                              backgroundColor: Colors
                                  .white, // Background color of the entire text
                            ),
                          ),
                          TextSpan(
                            text: character.status,
                            style: TextStyle(
                              color: character.cleanStatus
                                  .color, // Color for character.status
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Abilitites'),
                    Text(character.abilities.length.toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Code names'),
                    Text(character.alias.length.toString())
                  ],
                ),
              ),
            ],
          ),
        ),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
      ],
    );
  }
}
