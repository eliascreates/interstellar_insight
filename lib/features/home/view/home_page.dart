import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:interstellar_insight/features/episodes/episodes.dart';
import 'package:interstellar_insight/features/locations/locations.dart';

import '../cubit/home_cubit.dart';
import '../widgets/gnavigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeBody(),
      bottomNavigationBar: GNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;

    switch (state) {
      case HomeState.characters:
        return const CharactersPage();
      case HomeState.episodes:
        return const EpisodesPage();
      case HomeState.locations:
        return const LocationsPage();
      case HomeState.quotes:
        return Center(
          child: Text(
            'Quotes Page',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
    }
  }
}
