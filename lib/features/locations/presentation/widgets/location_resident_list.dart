import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../characters/characters.dart';
import '../../domain/domain.dart';
import 'location_resident_card.dart';

class LocationInhabitantList extends StatelessWidget {
  const LocationInhabitantList({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    final featuredIds = location.notableResidents.map((character) {
      final strId = character.split('/').last.trim();

      return int.tryParse(strId) ?? -1;
    });

    final characters = context.select(
      (CharactersBloc bloc) => bloc.state.characters,
    );

    if (characters.isEmpty) {
      return const SizedBox();
    }

    final notableResidents = featuredIds.map((id) {
      return characters.firstWhere(
        (character) => character.id == id,
      );
    }).toList();

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          LocationResidentCard(notableResidents[index]),
      separatorBuilder: (context, i) => const SizedBox(width: 20),
      itemCount: notableResidents.length,
    );
  }
}
