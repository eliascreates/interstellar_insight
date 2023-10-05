import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:interstellar_insight/features/episodes/episodes.dart';
import 'package:interstellar_insight/features/home/home.dart';
import 'package:interstellar_insight/features/locations/presentation/bloc/locations_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool openApp = true;

    final tabAppStarts = context.watch<HomeCubit>().state;

    switch (tabAppStarts) {
      case HomeState.characters:
        openApp = context.select(
          (CharactersBloc bloc) => bloc.state.characters.isNotEmpty,
        );
      case HomeState.episodes:
        openApp = context.select(
          (EpisodesBloc bloc) => bloc.state.episodes.isNotEmpty,
        );
      case HomeState.locations:
      case HomeState.quotes:
        openApp = context.select(
          (LocationsBloc bloc) => bloc.state.locations.isNotEmpty,
        );
    }

    if (openApp) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/intro.jpeg',
            colorBlendMode: BlendMode.saturation,
            color: Theme.of(context).colorScheme.surfaceTint,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
