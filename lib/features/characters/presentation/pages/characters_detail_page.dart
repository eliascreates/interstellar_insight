import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';
import 'package:interstellar_insight/core/shared/shared.dart';

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
                padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: Column(
                  children: [
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: [
                        DetailTag(
                          tagName: 'Status',
                          tagValue:
                              character.cleanStatus.name[0].toUpperCase() +
                                  character.cleanStatus.name.substring(1),
                          backgroundColor: character.cleanStatus.color,
                          foregroundColor:
                              character.cleanStatus == CharacterStatus.destroyed
                                  ? Colors.white
                                  : null,
                        ),
                        DetailTag(
                          tagName: 'Hair Color',
                          tagValue: character.hair.contains('None')
                              ? 'None'
                              : character.hair,
                        ),
                        DetailTag(
                          tagName: 'Species',
                          tagValue: character.species,
                        ),
                        DetailTag(
                          tagName: 'Origin',
                          tagValue: character.origin,
                          backgroundColor: character.cleanStatus.color,
                          foregroundColor:
                              character.cleanStatus == CharacterStatus.destroyed
                                  ? Colors.white
                                  : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Abilitites',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${character.abilities.length}',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children:
                          List.generate(character.abilities.length, (index) {
                        return DetailTag(
                          tagName: character.abilities.elementAt(index),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Code Names',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${character.alias.length}',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: List.generate(character.alias.length, (index) {
                        return DetailTag(
                          tagName: character.alias.elementAt(index),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
