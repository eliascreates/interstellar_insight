import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:interstellar_insight/features/characters/presentation/pages/character_page.dart';

import '../cubit/home_cubit.dart';
import '../widgets/gnavigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        return const CharacterPage();
      case HomeState.episodes:
        return Center(
          child: Text(
            'Episode Page',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      case HomeState.locations:
        return Center(
          child: Text(
            'Locations Page',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        );
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
