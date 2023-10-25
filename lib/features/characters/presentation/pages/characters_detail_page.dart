import 'package:flutter/material.dart';

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
              CharacterDetailBody(character: character),
            ],
          ),
        ),
      ],
    );
  }
}
